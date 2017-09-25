<?php

$app->get('/query3/{ano}', function($request, $response, $args){
    $db = $this->db;

    $ano = $args['ano'];

    $data = $db->query("SELECT
                            (CASE EXTRACT (MONTH FROM V.data)
                                WHEN '1' THEN 'Janeiro'
                                WHEN '2' THEN 'Fevereiro'
                                WHEN '3' THEN 'Março'
                                WHEN '4' THEN 'Abril'
                                WHEN '5' THEN 'Maio'
                                WHEN '6' THEN 'Junho'
                                WHEN '7' THEN 'Julho'
                                WHEN '8' THEN 'Agosto'
                                WHEN '9' THEN 'Setembro'
                                WHEN '10' THEN 'Outubro'
                                WHEN '11' THEN 'Novembro'
                                WHEN '12' THEN 'Dezembro'
                            END) AS mes,
                            COUNT(I.id_ingresso) as quantidade_ingressos
                        FROM cinema.vendas V
                        INNER JOIN cinema.ingressos I ON (I.id_venda = V.id_venda)
                        WHERE EXTRACT (YEAR FROM V.data) = '$ano'
                        GROUP BY mes
    ")->fetchAll();


    return $response->withJson($data, 200);
});