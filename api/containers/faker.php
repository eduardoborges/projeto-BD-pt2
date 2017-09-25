<?php

$container['faker'] = function($container){

    $faker = new Faker\Generator();
    $faker->addProvider(new Faker\Provider\pt_BR\Person($faker));
    $faker->addProvider(new Faker\Provider\pt_BR\PhoneNumber($faker));
    $faker->addProvider(new Faker\Provider\pt_BR\Address($faker));
    $faker->addProvider(new Faker\Provider\Base($faker));
    $faker->addProvider(new Faker\Provider\Address($faker));
    $faker->addProvider(new Faker\Provider\Lorem($faker));
    $faker->addProvider(new Faker\Provider\Internet($faker));
    $faker->addProvider(new Faker\Provider\DateTime($faker));
    

    return $faker;
};