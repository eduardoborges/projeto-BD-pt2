<?php

use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

$app->get('/', function(ServerRequestInterface $request, ResponseInterface $response){
    $data = array('name' => 'Bob', 'age' => 40);

    return $response->withJson($data, 200);
});