<?php

use Symfony\Component\Dotenv\Dotenv;
use CinemaCMS\Database;

class CinemaCMS {

    public function boot()
    {
        $this->connect();
        $this->route();
    }


    public function connect()
    {
        $db = new Database;
        $db->connect();
    }

    private function route()
    {
        
    }
}

?>