<?php

$app->get('/query10', function($request, $response, $args){
    $db = $this->db;

    $data = $db->query("SELECT
                            E.estado,
                            COUNT(FG.id_funcionario_gerente) AS quantidade_gerentes,
                            COUNT(FV.id_funcionario_vendedor) AS quantidade_vendedores
                        FROM cinema.funcionarios F
                        INNER JOIN cinema.enderecos E ON (E.id_endereco = F.id_endereco)
                        LEFT JOIN cinema.funcionarios_gerente FG ON (FG.cpf_funcionario = F.cpf)
                        LEFT JOIN cinema.funcionarios_vendedor FV ON (FV.cpf_funcionario = F.cpf)
                        GROUP BY E.estado
                        ORDER BY E.estado;
    ")->fetchAll();


    return $response->withJson($data, 200);
});