Validador de Hash em PowerShell

Este script em PowerShell permite verificar a integridade de um arquivo baixado comparando sua hash com uma hash de referência fornecida pelo usuário. A ferramenta é útil para garantir que o arquivo não foi corrompido ou modificado.

Como Funciona

	1.	Ao executar o script, você será solicitado a selecionar o arquivo que deseja verificar.
	2.	Em seguida, insira a hash de referência (MD5, SHA-1, SHA-256, etc.) para comparação.
	3.	O script calculará a hash do arquivo e verificará se ela corresponde à hash fornecida.

Pré-requisitos

	•	PowerShell 5.1 ou superior.
	•	Windows 7 ou superior.

Como Usar

	1.	Clone este repositório ou faça o download do script.
	2.	Abra o PowerShell e navegue até o diretório onde o script foi salvo.
	3.	Execute o script com o seguinte comando:
  
  .\validador-hash.ps1
 
  4.	Siga as instruções na tela para selecionar o arquivo e inserir a hash de referência.

Exemplo de Uso

Suponha que você baixou um arquivo chamado software.zip e o provedor disponibilizou a hash SHA-256 d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2. 
Para verificar se o arquivo está íntegro, execute o script, selecione o arquivo e insira a hash fornecida.

Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e enviar pull requests.

Licença

Este projeto está licenciado sob a Licença MIT.

Este README fornece uma visão geral clara do projeto, facilitando a compreensão e uso do script por outros usuários.
