<?php session_start(); ?>
<html>
<head>
	<title>Consultation rapport visite</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");



echo "<h1 style=\"text-align:center\">Consultation des rapports de visite</h1>";

//Requete pour recupere la date
$reqDate = "SELECT rapDate FROM rapportvisite";
$resultDate = $connexion->query($reqDate);
$ligneDate = $resultDate->fetch();

?>
<form action="consultation.php" method="post">
	Choisissez la date du rapport à consulter : <select  name="recherche">
		<option value="*">
				<?php
				while ($ligneDate) {
						$dateChoisie = substr($ligneDate['rapDate'],0,10);
						echo "<option value='$dateChoisie'>$dateChoisie</option>";
						$ligneDate = $resultDate->fetch();
				}
				?>
		</option>
	</select>
	<input type="submit" value="Envoyer">
</form>

<?php if (isset($_POST['recherche'])): ?>
	<?php
	$dateDeRecherche = $_POST['recherche'];
	//Requete de recherche
	$req = "SELECT * FROM rapportvisite WHERE rapDate = '$dateDeRecherche' ORDER BY rapNum";
	$rep = $connexion->query($req);
	$ligne = $rep->fetch();

	//Affhichage de la date
	echo "<h2>Voici le(s) rapport(s) pour le $dateDeRecherche : </h2>";

	 ?>



	<table>
		<tr>
			<th>Matricule du visiteur</th>
			<?php while ($ligne) {
			?><td><?php echo $ligne['visMatricule']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Numero du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo $ligne['rapNum']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Practicien</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo $ligne['praNum']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Motif du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><input name="RAP_MOTIF" type="text" style="text-align:right"value="<?php echo $ligne['rapMotif'] ?>"></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Produit 1</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><input type="text" name="PROD1" style="text-align:right"value="<?php echo $ligne['prod1'] ?>"></td><?php
			$ligne = $rep->fetch();
	  	} ?>
		</tr>
		<tr>
			<th>Produit 2</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><input name="PROD2" type="text" style="text-align:right"value="<?php echo $ligne['prod2'] ?>"></td><?php
			$ligne = $rep->fetch();
  		} ?>
		</tr>
		<tr>
			<th>Coefficient de confiance</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
		  while ($ligne) {
			?><td><select  name="CoeffConf">
				<option style="text-align:right" value="<?php echo $ligne['CoeffCOnf'] ?>"><?php echo $ligne['CoeffCOnf'] ?></option>
				<?php
				for ($i=1; $i < 5; $i++) {
					if ($i != $ligne['CoeffCOnf']) {
						?><option style="text-align:right" value="<?php echo $i?>"><?php echo $i ?></option><?php
					}
				}
				?>
			</select>  </td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Bilan du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><textarea  name="RAP_BILAN" style="text-align:right" ><?php echo $ligne['rapBilan']; ?></textarea></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<td>

			</td>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo "<form action=\"modifierRapport.php\"><input type='submit' value='Modifier ce rapport' /></form>" ?></td><?php
			$ligne = $rep->fetch();
		} ?>

		</tr>
	</table>
<?php endif; ?>


<?php

include("includes/footer.php");
 ?>
</html>
