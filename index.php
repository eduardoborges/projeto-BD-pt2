<?php

require __DIR__."/vendor/autoload.php";
require __DIR__."/config/database.php";
require __DIR__."/src/boot.php";


$system = new CinemaCMS();
$system->boot();
