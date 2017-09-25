## Projeto Banco de dados - Cinema


Nesta aplicação desenvolvemos um pequeno sistema de cinema utilizando a arquitetura cliente - servidor da seguinte forma:

Pastas:
´api´ - Aqui fica os arquivos da API responsavel pelas querys e processamento;
´client´ - Aqui fica o cliente que irá conversar com a API e receber os dados; 

Para executar esta aplicação é necessário baixar um release no respositório e executar:

$ php -S localhost:3000

É necessário que possua o PHP >= 5.6 em sua máquina.


### Configurar ambiente de desenvolvimento

É necessário o Composer e o Node, pois eles que gerenciam as dependências.

$ git clone https://github.com/eduardoborges/projeto-BD-pt2 && cd projeto-BD-pt2
$ cd api && composer install && cd ../client && npm i

Agora só executar o servidor de API dentro pasta ´apí´:

$ php -S localhost:3000

E simultaneamente execute o cliente na pasta ´client´:

$ npm start
