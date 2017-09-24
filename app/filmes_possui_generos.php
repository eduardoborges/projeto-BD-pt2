<?php

$app->get('/filmes_possui_generos/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $allFilmes  = $db->query("SELECT * FROM cinema.filmes")->fetchAll();
    $allGeneros = $db->query("SELECT * FROM cinema.generos")->fetchAll();

    $query  = $db->prepare("INSERT INTO cinema.filmes_possui_generos
    VALUES(:id_filme, :id_genero) ");

    $query->bindParam(":id_filme", $id_filme);
    $query->bindParam(":id_genero", $id_genero);

    for ($i=0; $i < 50; $i++) { 
        $id_filme  = $allFilmes[$i]['id_filme'];
        $id_genero = $allGeneros[rand(0,count($allGeneros)-1)]['id_genero'];

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});