<?php

$app->get('/query5/{data_inicial}/{data_final}', function($request, $response, $args){
    $db = $this->db;

    $data_inicial   = $args['data_inicial'];
    $data_final     = $args['data_final'];

    $data = $db->query("SELECT
                            F.nome as nome_filme,
                            DH.data_hora as data
                        FROM cinema.filmes F
                        INNER JOIN cinema.sessoes S ON (S.id_filme = F.id_filme)
                        INNER JOIN cinema.horarios DH ON (DH.id_horario = S.id_horario)
                        WHERE DH.data_hora BETWEEN '$data_inicial' and '$data_final'
    ")->fetchAll();


    return $response->withJson($data, 200);
});