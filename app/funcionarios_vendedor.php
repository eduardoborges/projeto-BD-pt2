<?php

$app->get('/funcionarios_vendedor/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $allFuncionarios = $db->query("SELECT * FROM cinema.funcionarios
    WHERE cpf NOT IN ( SELECT cpf_funcionario from cinema.funcionarios_gerente ) ")->fetchAll();


    $query  = $db->prepare("INSERT INTO cinema.funcionarios_vendedor
    VALUES(:id, :comissao, :cpf_funcionario) ");

    $query->bindParam(":id", $id);
    $query->bindParam(":comissao", $comissao);
    $query->bindParam(":cpf_funcionario", $cpf_funcionario);

    foreach ($allFuncionarios as $key => $func) {
        $id                 = $key + 1;
        $comissao           = $faker->randomElement(array(1,5,10));
        $cpf_funcionario    = $func['cpf'];

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro: ".$db->errorInfo()[2];
        };
    }

});