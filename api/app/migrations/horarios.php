<?php

$app->get('/horarios/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.horarios
    VALUES(DEFAULT, :data_hora) ");

    $query->bindParam(":data_hora", $data_hora);

    for ($i=0; $i < 50; $i++) { 
        $data_hora = $faker->iso8601('now');

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});