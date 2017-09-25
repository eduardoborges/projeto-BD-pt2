<?php

$app->get('/generos', function($request, $response){
    $db = $this->get('db');


    $data = $db->query("SELECT id_genero,nome FROM cinema.generos")->fetchAll();

    return $response->withJson($data, 200);
    
});