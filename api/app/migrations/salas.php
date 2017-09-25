<?php


$app->get('/salas/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.salas
    VALUES(DEFAULT, :capacidade, :numero) ");

    $query->bindParam(":capacidade", $capacidade);
    $query->bindParam(":numero", $numero);

    for ($i=0; $i < 15; $i++) { 
        $capacidade = rand(30,100);
        $numero     = $i+1;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }
});