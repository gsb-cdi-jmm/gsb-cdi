<?php

session_start();

include 'includes/connexionBdd.php';

$Vmatricule = $_POST['matricule'];
$mdpSaisie = $_POST['mdp'];

$reSQL = "SELECT visMatricule, password, visPrenom from visiteur where visMatricule = '$Vmatricule'";
$result = $connexion->query($reSQL);
$ligne = $result->fetch();

$mdpbdd = $ligne['password'];
$prenom = $ligne['visPrenom'];

if ($mdpSaisie == $mdpbdd) {
  echo "c'est bon";
  $_SESSION['connect'] = true;
  $_SESSION['prenom'] = $prenom;
}
else {
  echo "<script>alert(\"Identifiant ou mot de passe incorect\")</script>";
  include("login.php");
}












 ?>
