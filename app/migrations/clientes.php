<?php

$app->get('/clientes/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.clientes VALUES(:cpf , :tel_res , :tel_cel, :id_endereco, :nome) ");

    $query->bindParam(":cpf", $cpf);
    $query->bindParam(":tel_res", $tel_res);
    $query->bindParam(":tel_cel", $tel_cel);
    $query->bindParam(":id_endereco", $id_endereco);
    $query->bindParam(":nome", $nome);

    for ($i=0; $i < 50; $i++) { 
        $cpf        = $faker->cpf(false);
        $tel_res    = $faker->landlineNumber(false);
        $tel_cel    = $faker->cellphone(false);
        $id_endereco= $i + 203;
        $nome       = $faker->name;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }
});