<?php
use Symfony\Component\Dotenv\Dotenv;


$container = $app->getContainer();
$container['db'] = function ($container) {
    try {
        $host         = getEnv('DB_HOST');
        $database     = getEnv('DB_DATABASE');
        $user         = getEnv('DB_USERNAME');
        $password     = getEnv('DB_PASSWORD') ? getEnv("DB_PASSWORD") : "";
        $port         = getEnv('DB_PORT');
        
        $conectionString = "pgsql:host=$host;dbname=$database;user=$user;port=$port". ($password ? ";password=$password" : "");

        $db = new PDO($conectionString);
        return $db;
    } catch (\PDOException  $e) {
        die("<h1>Erro ao conectar Banco de dados:</h1>" . $e->getMessage());
    };
};