<?php

$app->get('/sessoes/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.sessoes
    VALUES(DEFAULT, :id_filme, :id_horario, :id_sala) ");

    $query->bindParam(":id_filme", $id_filme);
    $query->bindParam(":id_horario", $id_horario);
    $query->bindParam(":id_sala", $id_sala);

    for ($i=0; $i < 50; $i++) { 
        $id_filme = $i;
        $id_horario = $i;
        $id_sala = $i;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});