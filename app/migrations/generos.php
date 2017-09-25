<?php

$app->get('/generos/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.generos
    VALUES(DEFAULT, :nome) ");

    $query->bindParam(":nome", $nome);

    for ($i=0; $i < 50; $i++) { 
        $nome = $faker->lastName;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});