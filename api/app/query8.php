<?php

$app->get('/query8/{cpf}', function($request, $response, $args){
    $db = $this->db;

    $cpf = $args['cpf'];

    $data = $db->query("SELECT 
                            I.id_ingresso,
                            v.data,
                            F.nome,
                            I.preco
                        FROM cinema.ingressos I 
                        INNER JOIN cinema.vendas V ON (V.id_venda = I.id_venda)
                        INNER JOIN cinema.sessoes S ON (S.id_sessao = I.id_sessao)
                        INNER JOIN cinema.horarios H ON (H.id_horario = S.id_horario)
                        INNER JOIN cinema.filmes F ON (F.id_filme = S.id_sessao)
                        WHERE V.cpf_funcionario = '$cpf';
    ")->fetchAll();


    return $response->withJson($data, 200);
});