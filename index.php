<?php

require __DIR__."/vendor/autoload.php";

date_default_timezone_set('America/Bahia');

use Symfony\Component\Dotenv\Dotenv;

$dotenv = new Dotenv();
$dotenv->load(__DIR__.'/.env');


$app = new \Slim\App;

//containers
require __DIR__."/containers/database.php";
require __DIR__."/containers/faker.php";

// controladores
require __DIR__."/app/enderecos.php";
require __DIR__."/app/clientes.php";
require __DIR__."/app/salas.php";
require __DIR__."/app/filmes.php";
require __DIR__."/app/funcionarios.php";
require __DIR__."/app/horarios.php";
require __DIR__."/app/generos.php";
require __DIR__."/app/sessoes.php";
require __DIR__."/app/clientesVIP.php";
require __DIR__."/app/filmes_possui_generos.php";
require __DIR__."/app/venda.php";
require __DIR__."/app/ingressos.php";
require __DIR__."/app/funcionarios_gerente.php";
require __DIR__."/app/funcionarios_vendedor.php";

//boot app
$app->run();