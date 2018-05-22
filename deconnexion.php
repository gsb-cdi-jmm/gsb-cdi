<?php
session_start();
session_destroy();

$deconnect = true;

echo "<h1 style=\"text-align: center;color:#5599EE;\">Vous etes bien deconnecter</h1>";

include 'index.php';

 ?>
