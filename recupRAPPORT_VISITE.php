<?php

include("includes/connexionBdd.php");


if (isset($_POST['RAP_DATEVISITE']) && isset($_POST['RAP_MOTIF'])) {
  $dateVisite = $_POST['RAP_DATEVISITE'];
  $rapMotif = $_POST['RAP_MOTIF'];

  $req = "INSERT INTO rapportvisite(visMatricule, rapNum, praNum, rapDate, RAP_MOTIF) values('a17', 8, 11,'$dateVisite')";
  $rep = $connexion->exec($req) or die("Erreur dans la requete");
  echo "$dateVisite";
  echo "test";
}












































 ?>
