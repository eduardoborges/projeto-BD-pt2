<?php

$app->get('/venda/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $allClientes     = $db->query("SELECT * FROM cinema.clientes")->fetchAll();
    $allFuncionarios = $db->query("SELECT * FROM cinema.funcionarios")->fetchAll();
    $allFilmes       = $db->query("SELECT * FROM cinema.filmes")->fetchAll();

    $query  = $db->prepare("INSERT INTO cinema.vendas
    VALUES(DEFAULT, :data, :cpf_cliente, :cpf_funcionario) ");

    $query->bindParam(":data", $data);
    $query->bindParam(":cpf_cliente", $cpf_cliente);
    $query->bindParam(":cpf_funcionario", $cpf_funcionario);

    for ($i=0; $i < 150; $i++) { 
        $data            = $faker->iso8601('now');
        $cpf_cliente     = $allClientes[rand( 0, count($allClientes)-1 )]['cpf'];
        $cpf_funcionario = $allFuncionarios[rand( 0, count($allFuncionarios)-1 )]['cpf'];

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});