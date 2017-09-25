<?php

$app->get('/query2/{id}', function($request, $response, $args){
    $db = $this->db;

    $id = $args['id'];

    $data = $db->query("SELECT 
                            F.nome,
                            SS.numero,
                            H.data_hora
                        FROM cinema.filmes F
                        LEFT JOIN cinema.sessoes S ON (S.id_filme = F.id_filme)
                        LEFT JOIN cinema.salas SS ON (SS.id_sala = S.id_sala)
                        INNER JOIN cinema.horarios H on (H.id_horario = S.id_horario)
                        WHERE EXISTS (SELECT 1
                                        FROM cinema.filmes_possui_generos FPG
                                        WHERE F.id_filme = FPG.id_filme
                                        AND FPG.id_genero = $id)
    ")->fetchAll();


    return $response->withJson($data, 200);
});