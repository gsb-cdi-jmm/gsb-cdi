<?php
//On verifie que l'on est pas déjà passé sur la page afin de réouvrir une session déja existante

session_start();
$matricule = htmlentities($_SESSION['matricule']);

include("includes/connexionBdd.php");

//
if (isset($_POST['RAP_DATEVISITE'])) {
  $dateVisite = htmlentities($_POST['RAP_DATEVISITE']);
}
if(isset($_POST['PRA_NUM']))
{
  $practicien = htmlentities($_POST['PRA_NUM']);
}
if (isset($_POST['RAP_MOTIF'])) {
  $rapMotif = htmlentities($_POST['RAP_MOTIF']);
}



var_dump($practicien);

//On vérifie que le praticien à rentrer toutes les informations correctements
//On verifie que la date n'est pas vide
if ($dateVisite != "") {
  //On vérifie que le practicien a été selectionné
  if ($practicien != "") {
    $req = "INSERT INTO rapportvisite(visMatricule, praNum, rapDate) values('$matricule', 1, '$dateVisite')";
    $rep = $connexion->exec($req) or die("Erreur dans la requete");
    echo "$dateVisite";
    echo "test";
  }
  else {
    echo "<h2 style=\"color:red;text-align:center\">Le practicien n'a pas été rempli</h2>";
    include('formRAPPORT_VISITE.php');
  }

}else{
  echo "<h2 style=\"color:red;text-align:center\">La date n'est pas rempli correctement</h2>";
  include('formRAPPORT_VISITE.php');
}












































 ?>
