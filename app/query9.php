<?php

$app->get('/query9', function($request, $response, $args){
    $db = $this->db;

    $data = $db->query("SELECT F.nome
                        FROM cinema.filmes F
                        WHERE F.id_filme NOT IN (SELECT id_filme
                                            FROM cinema.sessoes S
                                            INNER JOIN cinema.ingressos I ON (I.id_sessao = S.id_sessao)
                                            INNER JOIN cinema.vendas V ON (V.id_venda = I.id_venda)
                                            );
    ")->fetchAll();


    return $response->withJson($data, 200);
});