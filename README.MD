# Projeto Banco de dados - Cinema

Nesta aplicação desenvolvemos um pequeno sistema de cinema utilizando a arquitetura cliente - servidor da seguinte forma.

## Estrutura de Pastas

```plain
.
├── api [server-side app]
│   ├── app
│   │   ├── apis
│   │   └── migrations
│   └── containers
|
|
└── client [client side app]
    ├── public
    └── src
        ├── __tests__
        ├── api
        ├── components
        ├── styles
        └── views
            ├── Dashboard
            │   ├── Overview
            │   └── Querys
            └── Home

17 directories
```

## Execução

  1. Baixe um [release](https://github.com/eduardoborges/projeto-BD-pt2/releases) no respositório;
  2. Configure o banco de dados da api no arquivo ```.env``` na pasta ```api```
  3. Execute: 

``` sh
$ php -S localhost:3000
```

Basta abrir a url [http://localhost:3000](http://localhost:3000) em seu navegador.

**É necessário que possua o PHP >= 5.6 em sua máquina.**



## Quer desenvolver?

 E necessário o **Composer** e o **Node**, pois eles que gerenciam as dependências.
```sh
$ git clone https://github.com/eduardoborges/projeto-BD-pt2 && cd projeto-BD-pt2
$ cd api && composer install && cd ../client && npm i
```

Agora só executar o servidor de API dentro pasta ```api```:

```sh
$ php -S localhost:8000
```

E simultaneamente execute o cliente na pasta ```client```:

```sh
$ npm start
```

## Bibliotecas utilizadas

Esta aplicação utiliza algumas bibliotecas:

* [Slim Framework](https://www.slimframework.com/) - Para ajudar a criar as rotas e esqueleto da API.
* [PDO](http://php.net/manual/pt_BR/class.pdo.php) - Biblioteca para efetuar querys no banco.
* [React](https://facebook.github.io/react/) - Utilizamos para construir a interface do app.
* [react-router](https://github.com/ReactTraining/react-router) - Auxiliou na construcao das rotas da interface.
* [axios](https://github.com/mzabriskie/axios) - Uma biblioteca para fazer requisições pela interface.
* [Bulma](http://bulma.io) - Um framework pra fazer uma interface bonitinha.

License
----

MIT


**Free Software, Hell Yeah!**