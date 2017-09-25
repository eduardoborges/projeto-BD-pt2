# Projeto Banco de dados - Cinema

Nesta aplicação desenvolvemos um pequeno sistema de cinema utilizando a arquitetura cliente - servidor da seguinte forma.

## Estrutura de Pastas

  - ```/api/``` Aqui fica os arquivos da API responsavel pelas querys e processamento
  - ```/client/``` Aqui fica o cliente que irá conversar com a API e receber os dados
    - ```/client/src``` Aquivos de origem do cliente, escrito em React

## Execução

  Para executar esta aplicação é necessário baixar um [release](https://github.com/eduardoborges/projeto-BD-pt2/releases) no respositório e executar:
```sh
$ php -S localhost:3000
```
Basta abrir a url [http://localhost:3000](http://localhost:3000) em seu navegador.

**É necessário que possua o PHP >= 5.6 em sua máquina.**



### Instalação (Ambiente de Desenolvimento)

 necessário o Composer e o Node, pois eles que gerenciam as dependências.
```sh
$ git clone https://github.com/eduardoborges/projeto-BD-pt2 && cd projeto-BD-pt2
$ cd api && composer install && cd ../client && npm i
```

Agora só executar o servidor de API dentro pasta ```api```:

```sh
$ php -S localhost:3000
```

E simultaneamente execute o cliente na pasta ```client```:

```sh
$ npm start
```

## Bibliotecas utilizadas

Esta aplicação utiliza algumas bibliotecas:

* [Slim Framework]() - HTML enhanced for web apps!
* [PDO]() - HTML enhanced for web apps!
* [React]() - awesome web-based text editor
* [react-router]() - awesome web-based text editor
* [axios]() - awesome web-based text editor
* [Bulma]() - awesome web-based text editor

License
----

MIT


**Free Software, Hell Yeah!**