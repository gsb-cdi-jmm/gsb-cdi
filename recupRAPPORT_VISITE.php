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
  $reqPractien = "SELECT praNum FROM praticien WHERE praNom = \"$practicien\"";
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
  //On verifie quelle valeur à pris le motif afin de lui attribuer une valeure compréhensible
  switch ($rapMotif) {
    case 'PRD':
      $rapMotif = 'Periodicite';
      break;
      case 'ACT':
        $rapMotif = 'Actualisation annuel';
        break;
        case 'REL':
          $rapMotif = 'Relance Annuel';
          break;
          case 'SOL':
            $rapMotif = 'Sollicitation praticien';
            break;
    default:
      $rapMotif = 'Autre';
      break;
  }
}

if (isset($_POST['CoeffConf'])) {
  $coeffConf = $_POST['CoeffConf'];
}


if (isset($_POST['PROD1'])) {
  $produit1 = $_POST['PROD1'];
  //On recupere medDepotlegal grâce à une requete et le nom du produit
  $reqProd1 = "SELECT medDepotlegal FROM medicament WHERE medNomcommercial = '$produit1'";
  $repProd1 = $connexion->query($reqProd1);
  $medicament1 = $repProd1->fetch();
}
if (isset($_POST['PROD2'])) {
  $produit2 = $_POST['PROD2'];
  //On recupere medDepotlegal grâce à une requete et le nom du produit
  $reqProd2 = "SELECT medDepotlegal FROM medicament WHERE medNomcommercial = '$produit2'";
  $repProd2 = $connexion->query($reqProd2);
  $medicament2 = $repProd2->fetch();
}
else {
  $medicament['0'] = "Aucun";
}


//Requete recuperation du dernier practicien
$reqLastPra = "SELECT max(rapNum) FROM rapportvisite WHERE visMatricule = \"" . $matricule . "\"";
$repLastPra = $connexion->query($reqLastPra);
$ligneLastPra = $repLastPra->fetch();
if ($ligneLastPra['0'] == NULL) {
  $ligneLastPra['0'] = 1;
}
else {
  $ligneLastPra['0']++;
}

//Si des echantillons ont été données
$compteurEchantillon = 0;
if (isset($_POST['PRA_ECH1'])) {
  for ($i=0; $i < 10; $i++) {
    $praEch = 'PRA_ECH' . $i; //On recupere le nom du formulaire
    if (isset($_POST[$praEch])) {
      $praEchNom = $_POST[$praEch];//On recupere le nom du medicament
      //On fait un tableau pour récuperer le nom des Echanitllons
      $echantillonNom[$i] = $praEchNom;
    }
    $praQt = 'PRA_QTE' . $i; //On recupere le nom du formulaire
    if (isset($_POST[$praQt])) {
      $praQtNb = $_POST[$praQt]; //On recupere la quantité d'echanitllons
      //On fait un tableau pour recuperer la quantité d'echanitllons
      $echantillonQt[$i] = $praQtNb;
    }
  }
}

$compteurEchantillon = 0;
for ($i=1; $i < (count($echantillonQt) + 1) ; $i++) {
  $compteurEchantillon += $echantillonQt[$i];
}



//On vérifie que le praticien à rentrer toutes les informations correctements
//On verifie que la date n'est pas vide
if ($dateVisite != "") {
  //On vérifie que le practicien a été selectionné
  if ($practicien != "") {
    //On vérifie que le Bilan a bien été rempli
    if ($rapBilan != "") {
      //On vérifie que le motif à bien été rempli
      if ($rapMotif != "") {
        //On vérifie si le coefficient de confiance a été rempli
        if ($coeffConf != "") {
          //Maintenant on vérifie les éléments présenter
          if ($produit1 != "") {
            //On verifie que 10 echantillons ou moins on été entré
            if ($compteurEchantillon < 11) {
              if (isset($_POST['remplacant'])) {
                // code...
              }
              //Requete insertion dans rapport visite
              $req = "INSERT INTO rapportvisite(visMatricule, rapNum, praNum, rapDate, rapBilan, rapMotif, CoeffConf, prod1, prod2 ) values('$matricule', " . $ligneLastPra['0'] . ", " . $praNum['0'] . ", '$dateVisite', " . $rapBilan . ", '$rapMotif', $coeffConf, '" . $medicament1['0'] . "', '" . $medicament2['0'] . "')";
              $rep = $connexion->exec($req) or die("Erreur dans la requete");

              for ($i=1; $i <= count($echantillonQt); $i++) {
                //On recupere le nom du depot legal du medicament
                $reqMedDepotLegal = "SELECT medDepotlegal FROM medicament WHERE medNomcommercial = '$echantillonNom[$i]' ";
                $repMedDepotLegal = $connexion->query($reqMedDepotLegal);
                $ligneMedDepotLegal = $repMedDepotLegal->fetch();
                //Insertion des echantillons
                $reqInsert = "INSERT INTO offrir(visMatricule, rapNum, medDepotlegal, offQte) values('$matricule', " . $ligneLastPra['0'] . ", '" . $ligneMedDepotLegal['0'] . "', ". $echantillonQt[$i] .")";
                $rep = $connexion->exec($reqInsert) or die("Erreur dans la requete");
              }
              ?>
                <h1 style="text-align: center;color:#5599EE;">Votre rapport a été correctement enregistré</h1>
              <?php
              include("formRAPPORT_VISITE.php");
            }
            else{
              echo "<h2 style=\"color:red;text-align:center\">Veuillez entrer moins de 10 echantillons au total</h2>";
              include('formRAPPORT_VISITE.php');
            }

          }
          else{
            echo "<h2 style=\"color:red;text-align:center\">Le premier produit n'a pas été complété</h2>";
            include('formRAPPORT_VISITE.php');
          }

        }
        else {
          echo "<h2 style=\"color:red;text-align:center\">Le Coéfficient de confiance n'a pas été rempli</h2>";
          include('formRAPPORT_VISITE.php');
        }
      }
      else {
        echo "<h2 style=\"color:red;text-align:center\">Le motif n'a pas été rempli</h2>";
        include('formRAPPORT_VISITE.php');
      }
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
