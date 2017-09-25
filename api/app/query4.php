<?php

$app->get('/query4/{data_inicial}/{data_final}', function($request, $response, $args){
    $db = $this->db;

    $data_inicial   = $args['data_inicial'];
    $data_final     = $args['data_final'];

    $data = $db->query("SELECT 
                            F.nome AS nome_funcionario,
                            COUNT(I.id_ingresso) as quantidade_ingressos,
                            SUM(I.preco) as total_vendido
                        FROM cinema.vendas V
                        INNER JOIN cinema.ingressos I ON (I.id_venda = V.id_venda)
                        INNER JOIN cinema.funcionarios F ON (F.cpf = V.cpf_funcionario)
                        WHERE V.data BETWEEN '$data_inicial' AND '$data_final'
                        GROUP BY F.cpf
                        ORDER BY F.nome ASC;
    ")->fetchAll();


    return $response->withJson($data, 200);
});