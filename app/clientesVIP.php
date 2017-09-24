<?php

$app->get('/clientesvip/povoar', function(){
    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query       = $db->prepare("INSERT INTO cinema.clientes_vip VALUES(DEFAULT, :status, :data_ultimo_pagamento, :cpf_cliente) ");
    
    $findQuery   = $db->query("SELECT * FROM cinema.clientes");
    $findResults = $findQuery->fetchAll();

    $query->bindParam(":status", $status);
    $query->bindParam(":data_ultimo_pagamento", $data_ultimo_pagamento);
    $query->bindParam(":cpf_cliente", $cpf_cliente);

    for ($i=0; $i < 25; $i++) {
        
        $status                     = $faker->numberBetween(1,5);
        $data_ultimo_pagamento      = $faker->date('Y-m-d','now');
        $cpf_cliente                = $findResults[$i*2]['cpf'];

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }
});