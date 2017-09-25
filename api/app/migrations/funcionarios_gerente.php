<?php

$app->get('/funcionarios_gerente/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $allFuncionarios = $db->query("SELECT * FROM cinema.funcionarios")->fetchAll();

    $query  = $db->prepare("INSERT INTO cinema.funcionarios_gerente
    VALUES(:id, :setor, :adicional, :cpf_funcionario) ");

    //var_dump(randomFloat(2, 300, 1500));

    $query->bindParam(":id", $id);
    $query->bindParam(":setor", $setor);
    $query->bindParam(":adicional", $adicional);
    $query->bindParam(":cpf_funcionario", $cpf_funcionario);

    for ($i=0; $i < 25; $i++) { 

        $id                 = $id + 1;
        $setor              = $faker->randomElement(array('Gerência','Venda','RH'));
        $adicional          = $faker->randomFloat(2, 300, 1500);
        $cpf_funcionario    = $allFuncionarios[rand( 0, count($allFuncionarios)-1 )]['cpf'];

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro: ".$db->errorInfo()[2];
        };
    }
});