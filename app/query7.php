<?php

$app->get('/query7/{arrecadacao}/{ano}', function($request, $response, $args){
    $db = $this->db;

    $ano = $args['ano'];
    $arrecadacao =  $args['arrecadacao'] == "" 
                    || $args['arrecadacao'] == 0 
                    || $args['arrecadacao'] == null ? 0 : $args['arrecadacao'];

    $data = $db->query("SELECT 
                            E.estado,
                            COUNT(C.cpf) AS clientes_por_estado,
                            SUM(I.preco) AS arrecadacao_estado
                        FROM cinema.clientes C
                        INNER JOIN cinema.enderecos E ON (E.id_endereco = C.id_endereco)
                        INNER JOIN cinema.vendas V ON (V.cpf_cliente = C.cpf)
                        INNER JOIN cinema.ingressos I ON (I.id_venda = V.id_venda)
                        WHERE EXTRACT (YEAR FROM V.data) = $ano
                        GROUP BY E.estado
                        HAVING SUM(I.preco) > $arrecadacao 
                        ORDER BY E.estado;
    ")->fetchAll();


    return $response->withJson($data, 200);
});