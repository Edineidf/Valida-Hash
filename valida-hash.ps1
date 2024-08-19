# Valide a Policita atual: Get-ExecutionPolicy
#
# Caso seu script nao Execute desabilite a politica
# Set-ExecutionPolicy RemoteSigned
#
# Retorne a sua politica padrão.
# Set-ExecutionPolicy Restricted

Add-Type -AssemblyName System.Windows.Forms

function Show-HashValidator {
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Validador de Hash"
    $form.Size = New-Object System.Drawing.Size(400,400)
    $form.StartPosition = "CenterScreen"

    $labelFile = New-Object System.Windows.Forms.Label
    $labelFile.Location = New-Object System.Drawing.Point(10,20)
    $labelFile.Size = New-Object System.Drawing.Size(360,20)
    $labelFile.Text = "Selecione o Arquivo:"

    $textboxFile = New-Object System.Windows.Forms.TextBox
    $textboxFile.Location = New-Object System.Drawing.Point(10,50)
    $textboxFile.Size = New-Object System.Drawing.Size(260,20)

    $buttonBrowse = New-Object System.Windows.Forms.Button
    $buttonBrowse.Location = New-Object System.Drawing.Point(280,50)
    $buttonBrowse.Size = New-Object System.Drawing.Size(75,23)
    $buttonBrowse.Text = "Buscar"
    $buttonBrowse.Add_Click({
        $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $openFileDialog.Filter = "All files (*.*)|*.*"
        if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $textboxFile.Text = $openFileDialog.FileName
        }
    })

    $labelAlgorithm = New-Object System.Windows.Forms.Label
    $labelAlgorithm.Location = New-Object System.Drawing.Point(10,90)
    $labelAlgorithm.Size = New-Object System.Drawing.Size(360,20)
    $labelAlgorithm.Text = "Selecione o Algoritmo da Hash:"

    $comboboxAlgorithm = New-Object System.Windows.Forms.ComboBox
    $comboboxAlgorithm.Location = New-Object System.Drawing.Point(10,120)
    $comboboxAlgorithm.Size = New-Object System.Drawing.Size(360,20)
    $comboboxAlgorithm.Items.Add("SHA256")
    $comboboxAlgorithm.Items.Add("SHA1")
    $comboboxAlgorithm.Items.Add("MD5")
    $comboboxAlgorithm.SelectedIndex = 0

    $labelHash = New-Object System.Windows.Forms.Label
    $labelHash.Location = New-Object System.Drawing.Point(10,160)
    $labelHash.Size = New-Object System.Drawing.Size(360,20)
    $labelHash.Text = "Hash esperada para comparar arquivo selecionado:"

    $textboxHash = New-Object System.Windows.Forms.TextBox
    $textboxHash.Location = New-Object System.Drawing.Point(10,190)
    $textboxHash.Size = New-Object System.Drawing.Size(360,20)

    $buttonValidate = New-Object System.Windows.Forms.Button
    $buttonValidate.Location = New-Object System.Drawing.Point(150,230)
    $buttonValidate.Size = New-Object System.Drawing.Size(75,23)
    $buttonValidate.Text = "Validar"
    $buttonValidate.Add_Click({
        $filePath = $textboxFile.Text
        $expectedHash = $textboxHash.Text
        $algorithm = $comboboxAlgorithm.SelectedItem

        if (-Not (Test-Path $filePath)) {
            [System.Windows.Forms.MessageBox]::Show("Arquivo não encontrado.", "Erro")
            return
        }

        $fileHash = Get-FileHash -Path $filePath -Algorithm $algorithm
        if ($fileHash.Hash -eq $expectedHash) {
            [System.Windows.Forms.MessageBox]::Show("Hashe Correta!", "Sucesso")
        } else {
            [System.Windows.Forms.MessageBox]::Show("Hashe não Encontrada.", "Erro")
        }
    })

    $form.Controls.Add($labelFile)
    $form.Controls.Add($textboxFile)
    $form.Controls.Add($buttonBrowse)
    $form.Controls.Add($labelAlgorithm)
    $form.Controls.Add($comboboxAlgorithm)
    $form.Controls.Add($labelHash)
    $form.Controls.Add($textboxHash)
    $form.Controls.Add($buttonValidate)

    $form.Topmost = $true
    $form.Add_Shown({$form.Activate()})
    [void]$form.ShowDialog()
}

Show-HashValidator