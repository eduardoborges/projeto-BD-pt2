<?php

namespace CinemaCMS;

use Symfony\Component\Dotenv\Dotenv;

class Database
{
    private $host;
    private $database;
    private $user;
    private $password;
    private $port;

    public function __construct()
    {
        $this->host         = getEnv('DB_HOST');
        $this->database     = getEnv('DB_DATABASE');
        $this->user         = getEnv('DB_USERNAME');
        $this->password     = getEnv('DB_PASSWORD') ? getEnv("DB_PASSWORD") : "";
        $this->port         = getEnv('DB_PORT');
    }

    public function connect()
    {
        $connectString = "pgsql:host=".$this->host.";dbname=$this->database;user=$this->user;port=$this->port". ($this->password ? ";password=$this->password" : "");
        try {
            return new \PDO($connectString);
        } catch (\PDOException  $e) {
            die("<h1>Erro ao conectar Banco de dados:</h1>" . $e->getMessage());
        };
    }
}