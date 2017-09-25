<?php

$app->get('/query6/{mes}/{ano}', function($request, $response, $args){
    $db = $this->db;

    $mes  = $args['mes'];
    $ano  = $args['ano'];

    $data = $db->query("SELECT
                            F.cpf,
                            F.nome,
                            F.salario_base AS salario_base,
                            
                            (CASE TRUE
                                WHEN EXISTS (SELECT cpf 
                                                FROM cinema.funcionarios_vendedor
                                                WHERE cpf_funcionario = F.cpf)
                                THEN salario_base + (SELECT SUM(I.preco)
                                                        FROM cinema.vendas V
                                                        INNER JOIN cinema.ingressos I ON (I.id_venda = v.id_venda)
                                                        WHERE V.cpf_funcionario = F.cpf)
                                WHEN EXISTS (SELECT cpf 
                                                FROM cinema.funcionarios_gerente
                                                WHERE cpf_funcionario = F.cpf)
                                THEN salario_base + (SELECT SUM(adicional)
                                                        FROM cinema.funcionarios_gerente FG
                                                        WHERE FG.cpf_funcionario = F.cpf)
                                ELSE salario_base
                            END) AS salario_final,
                            COUNT(I.id_ingresso) as quantidade_ingressos
                        FROM cinema.funcionarios	F
                        INNER JOIN cinema.vendas V ON (V.cpf_funcionario = F.cpf)
                        INNER JOIN cinema.ingressos I ON (I.id_venda = V.id_venda)
                        WHERE EXTRACT (MONTH FROM V.data) in ($mes) and EXTRACT (YEAR FROM V.data) = $ano
                        GROUP BY F.cpf
    ")->fetchAll();


    return $response->withJson($data, 200);
});