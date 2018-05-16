<?php
//On verifie que l'on est pas déjà passé sur la page afin de réouvrir une session déja existante

session_start();
$matricule = htmlentities($_SESSION['matricule']);

include("includes/connexionBdd.php");

//creation des variables

if (isset($_POST['RAP_DATEVISITE'])) {
  $dateVisite = htmlentities($_POST['RAP_DATEVISITE']);
}
if(isset($_POST['PRA_NUM']))
{
  $practicien = htmlentities($_POST['PRA_NUM']);
  //Requete pour récuperer le numero du practicien
  $reqPractien = "SELECT `praNum` FROM `praticien` WHERE `praNom` = \"$practicien\"";
  $repPra = $connexion->query($reqPractien);
  $praNum = $repPra->fetch();
}

if(isset($_POST['RAP_BILAN'])){
  $rapBilan = htmlentities($_POST['RAP_BILAN']);
  if($rapBilan != ""){
    //Si il y a du texte on protege les chaines de caracteres
    $rapBilan = $connexion->quote($rapBilan);
  }
}

if (isset($_POST['RAP_MOTIF'])) {
  $rapMotif = htmlentities($_POST['RAP_MOTIF']);
}

var_dump($rapMotif);

//Requete recuperation du dernier practicien
$reqLastPra = "SELECT max(rapNum) FROM rapportvisite WHERE praNum = \"" .$praNum['0'] . "\"";
$repLastPra = $connexion->query($reqLastPra);
$ligneLastPra = $repLastPra->fetch();
if ($ligneLastPra['0'] == NULL) {
  $ligneLastPra['0'] = 1;
}
else {
  $ligneLastPra['0']++;
}
var_dump($rapBilan);
echo "$rapBilan";

//On vérifie que le praticien à rentrer toutes les informations correctements
//On verifie que la date n'est pas vide
if ($dateVisite != "") {
  //On vérifie que le practicien a été selectionné
  if ($practicien != "") {
    //On vérifie que le Bilan a bien été rempli
    if ($rapBilan != "") {
          $req = "INSERT INTO rapportvisite(visMatricule, rapNum, praNum, rapDate, rapBilan, rapMotif ) values('$matricule', " . $ligneLastPra['0'] . ", " . $praNum['0'] . ", '$dateVisite', " . $rapBilan .", " . $rapMotif . ")";
          $rep = $connexion->exec($req) or die("Erreur dans la requete");
          echo "test";
    }
    else {
      echo "<h2 style=\"color:red;text-align:center\">Le bilan n'a pas été rempli</h2>";
      include('formRAPPORT_VISITE.php');
    }

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
