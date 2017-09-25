<?php

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

$app->get('/query1/{nome}', function($request, $response, $args){
    $db = $this->db;

    $nome = $args['nome'];


    $data = $db->query("SELECT 
                            C.cpf AS cpf_cliente,
                            C.nome AS nome_cliente ,  
                            COUNT(I.id_ingresso) AS ingressos_comprados,
                            SUM(I.preco) AS total_gasto
                        FROM cinema.clientes C 
                        INNER JOIN cinema.vendas V ON (V.cpf_cliente = C.cpf)
                        INNER JOIN cinema.ingressos I ON (I.id_venda = V.id_venda)
                        WHERE upper(C.nome) LIKE upper('$nome%')
                        GROUP BY C.cpf
                        ORDER BY C.nome ASC
    ")->fetchAll();


    return $response->withJson($data, 200);
});