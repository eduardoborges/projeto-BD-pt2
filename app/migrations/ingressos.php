<?php

$app->get('/ingressos/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker'); 

    $allSessoes = $db->query("SELECT * FROM cinema.sessoes")->fetchAll();
    $allVendas  = $db->query("SELECT * FROM cinema.vendas")->fetchAll();

    $query  = $db->prepare("INSERT INTO cinema.ingressos
    VALUES(DEFAULT, :id_sessao, :id_venda, :preco) ");

    $query->bindParam(":id_sessao", $id_sessao);
    $query->bindParam(":id_venda",  $id_venda);
    $query->bindParam(":preco",     $preco);

    for ($i=0; $i < 500; $i++) { 
        $id_sessao = $allSessoes[array_rand($allSessoes)]['id_sessao'];
        $id_venda  = $allVendas[array_rand($allVendas)]['id_venda'];
        $preco     = $faker->randomElement(array(11.99,14.99,21.99));

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }


});