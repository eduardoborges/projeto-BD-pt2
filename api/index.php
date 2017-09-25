<?php

require __DIR__."/vendor/autoload.php";

header("Access-Control-Allow-Origin: *");
date_default_timezone_set('America/Bahia');

use Symfony\Component\Dotenv\Dotenv;

$dotenv = new Dotenv();
$dotenv->load(__DIR__.'/.env');


$app = new \Slim\App;

//containers
require __DIR__."/containers/database.php";
require __DIR__."/containers/faker.php";

require __DIR__."/app/query1.php";
require __DIR__."/app/query2.php";
require __DIR__."/app/query3.php";
require __DIR__."/app/query4.php";
require __DIR__."/app/query5.php";
require __DIR__."/app/query6.php";
require __DIR__."/app/query7.php";
require __DIR__."/app/query8.php";
require __DIR__."/app/query9.php";
require __DIR__."/app/query10.php";

// apis auxiliares
require __DIR__."/app/apis/generos.php";
require __DIR__."/app/apis/funcionarios.php";


// migrations
// require __DIR__."/app/migrations/index.php";
// require __DIR__."/app/migrations/enderecos.php";
// require __DIR__."/app/migrations/clientes.php";
// require __DIR__."/app/migrations/salas.php";
// require __DIR__."/app/migrations/filmes.php";
// require __DIR__."/app/migrations/funcionarios.php";
// require __DIR__."/app/migrations/horarios.php";
// require __DIR__."/app/migrations/generos.php";
// require __DIR__."/app/migrations/sessoes.php";
// require __DIR__."/app/migrations/clientesVIP.php";
// require __DIR__."/app/migrations/filmes_possui_generos.php";
// require __DIR__."/app/migrations/venda.php";
// require __DIR__."/app/migrations/ingressos.php";
// require __DIR__."/app/migrations/funcionarios_gerente.php";
// require __DIR__."/app/migrations/funcionarios_vendedor.php";

//boot app
$app->run();