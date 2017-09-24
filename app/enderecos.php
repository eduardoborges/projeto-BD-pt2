<?php

$app->get('/enderecos/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.enderecos VALUES(DEFAULT, :rua, :numero, :bairro, :cidade, :estado, :cep, :complemento, :referencia)");

    $query->bindParam(":rua", $rua);
    $query->bindParam(":numero", $numero);
    $query->bindParam(":bairro", $bairro);
    $query->bindParam(":cidade", $cidade);
    $query->bindParam(":estado", $estado);
    $query->bindParam(":cep", $cep);
    $query->bindParam(":complemento", $complemento);
    $query->bindParam(":referencia", $referencia);

    for ($i=0; $i < 50; $i++) { 
        $rua            = $faker->streetName;
        $numero         = $faker->buildingNumber;
        $bairro         = $faker->cityPrefix;
        $cidade         = $faker->city;
        $estado         = $faker->state;
        $cep            = $faker->postcode;
        $complemento    = $faker->secondaryAddress;
        $referencia     = $faker->secondaryAddress;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro";
        };
    }
});