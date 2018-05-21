<?php session_start(); ?>
<html>
<head>
	<title>Consultation rapport visite</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");

if(isset($_POST['update'])){
  if(!empty($_POST['RAP_MOTIF']) && !empty($_POST['PROD1']) && !empty($_POST['CoeffConf']) && !empty($_POST['RAP_BILAN'])){
    $q = $connexion->prepare("UPDATE rapportvisite SET rapMotif = :rapMotif, prod1 = :prod1, prod2 = :prod2, CoeffCOnf = :CoeffCOnf, rapBilan = :rapBilan WHERE id = :id ");
    if(empty($_POST['PROD2'])){
      $produit_2 = "Aucun";
    }else{
      $produit_2 = $_POST['PROD2'];
    }

    $q->execute([
      'rapMotif' => $_POST['RAP_MOTIF'],
      'prod1' => $_POST['PROD1'],
      'prod2' => $produit_2,
      'CoeffCOnf' => $_POST['CoeffConf'],
      'rapBilan' => $_POST['RAP_BILAN'],
      'id' => $_GET['id']
    ]);

    $success = "Les information on bien été modifier !";
  }else{
    $erreur = "Veuillez remplire tout les champs !";
  }
}
$q = $connexion->prepare("SELECT * FROM rapportvisite WHERE id = :id");
$q->execute(["id" => $_GET['id']]);

//On verifie qu'on a bien choisie un rapport à modifier
if($q->rowCount() == 0){
  header("Location: Consultation.php");
  exit();
}

$resultat = $q->fetch();
echo "<h1 style=\"text-align:center\">Modification du rapport numero " . $resultat['rapNum'] ."</h1>";


?>

<form method="POST">
  <?php
  if(isset($erreur)){ echo '<span style="color:red">'.$erreur.'</span><br/>'; }
  if(isset($success)){ echo '<span style="color:green">'.$success.'</span><br/>'; }
  ?>
  Motif du rapport :
	<select name="RAP_MOTIF">
		<option value="<?php echo $resultat['rapMotif'] ?>"> <?php echo $resultat['rapMotif'] ?></option>
		<?php

		if ($resultat['rapMotif'] != 'Periodicite') {
			echo "<option value=\"Périodicité\">Périodicité</option>";
		}
		if ($resultat['rapMotif'] != 'Actualisation annuelle') {
			echo "<option value=\"Actualisation annuelle\">Actualisation annuelle</option>";
		}
		if ($resultat['rapMotif'] != 'Relance Annuel') {
			echo "<option value=\"Relance Annuel\">Relance Annuel</option>";
		}
		if ($resultat['rapMotif'] != 'Sollicitation praticien') {
			echo "<option value=\"Sollicitation praticien\">Sollicitation praticien</option>";
		}
		if ($resultat['rapMotif'] != 'Autre') {
			echo "<option value=\"Autre\">Autre</option>";
		}

		?>


	</select><br>
  Produit 1 : <input type="text" name="PROD1" value="<?php echo $resultat['prod1'] ?>"><br>
  Produit 2 : <input type="text" name="PROD2" value="<?php echo $resultat['prod2'] ?>"><br>
  Coefficient de confiance :
		<select name="CoeffConf">
			<option value="<?php echo $resultat['CoeffCOnf']; ?>"><?php echo $resultat['CoeffCOnf']; ?></option>
			<?php for ($i=1; $i < 5; $i++) {
				if($i != $resultat['CoeffCOnf'])
				{
					echo "<option value=\"$i\">$i</option>";
				}
			} ?>
		</select><br>
  Bilan du rapport : <textarea type="text" name="RAP_BILAN" ><?php echo $resultat['rapBilan']; ?></textarea><br>
  <input type="submit" name="update" value="Modifier">
</form>
