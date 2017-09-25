<?php


$app->get('/funcionarios/povoar', function(){

    $db     = $this->get('db');
    $faker  = $this->get('faker');

    $query  = $db->prepare("INSERT INTO cinema.funcionarios VALUES(:cpf, :nome, :email, :data_admissao, :salario_base, :telefone_residencial, :telefone_celular, :id_endereco) ");
    
    $query->bindParam(":cpf", $cpf);
    $query->bindParam(":nome", $nome);
    $query->bindParam(":email", $email);
    $query->bindParam(":data_admissao", $data_admissao);
    $query->bindParam(":salario_base", $salario_base);
    $query->bindParam(":telefone_residencial", $telefone_residencial);
    $query->bindParam(":telefone_celular", $telefone_celular);
    $query->bindParam(":id_endereco", $id_endereco);
    

    for ($i=0; $i < 50; $i++) { 
        $cpf                    = $faker->cpf(false);
        $nome                   = $faker->name;
        $email                  = $faker->email;
        $data_admissao          = $faker->date('Y-m-d','now');
        $salario_base           = $faker->randomFloat(2, 937, 5000);
        $telefone_residencial   = $faker->landlineNumber(false);
        $telefone_celular       = $faker->cellphone(false);
        $id_endereco            = $i + 203;

        if($query->execute() ){
            echo "ok".PHP_EOL;
        } else {
            echo "erro".PHP_EOL;
        };
    }

    
});