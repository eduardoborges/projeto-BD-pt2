<?php

$app->get('/filmes/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.filmes
        VALUES(DEFAULT, :nome, :duracao, :diretor, :classificacao) ");

    $query->bindParam(":nome", $nome);
    $query->bindParam(":duracao", $duracao);
    $query->bindParam(":diretor", $diretor);
    $query->bindParam(":classificacao", $classificacao);

    for ($i=0; $i < 50; $i++) { 
        $nome           = $faker->sentence(4);
        $duracao        = $faker->numberBetween(30,240);
        $diretor        = $faker->name;
        $classificacao  = $faker->randomElement(array(0,10,13,16,18,21));

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }
});