<?php

$app->get('/funcionarios', function($request, $response){
    $db = $this->get('db');


    $data = $db->query("SELECT cpf,nome FROM cinema.funcionarios ORDER BY nome")->fetchAll();

    return $response->withJson($data, 200);
    
});