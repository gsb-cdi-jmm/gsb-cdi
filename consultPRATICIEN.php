<?php session_start(); ?>
<html>
<head>
	<title>Consultation rapport visite</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");



echo "<h1 style=\"text-align:center\">Consultation des Practiciens</h1>";

//Requete qui va nous permettre d'afficher tout les practiciens
$reqSql = "SELECT praNom, praPrenom FROM praticien";
$result = $connexion->query($reqSql);
$ligne = $result->fetch();

?>
<form action="consultPRATICIEN.php" method="post">
	Choisissez le practicien à consulter :
	<select name="recherche">
			<option value=""><?php
					while ($ligne) {
							$nom = $ligne['praNom'];
							$prenom = $ligne['praPrenom'];
							echo "<option value='$nom'>$nom $prenom</option>";
							$ligne = $result->fetch();
					} ?></option>
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
	$ligne = $rep->fetchAll(PDO::FETCH_OBJ);//Permet de retourner un objet

	//Affhichage de la date
	echo "<h2>Voici le(s) rapport(s) pour le $dateDeRecherche : </h2>";

	 ?>


	<table>
		<tr>
			<th>Matricule du visiteur</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->visMatricule ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Numero de rapport</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->rapNum ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Practicien</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praNum ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Motif du rapport</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->rapMotif  ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Produit 1 </th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->prod1 ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Produit 2 </th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->prod2 ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Coefficient de confiance </th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->CoeffCOnf ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Bilan du rapport </th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->rapBilan ?></td>
				<?php
			}
			?>
		</tr>

		<tr>
			<th>Options </th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><a href="recupConsultation.php?id=<?= $key->id ?>">Modifier</a></td>
				<?php
			}
			?>
		</tr>
	</table>
<?php endif; ?>


<?php

include("includes/footer.php");
 ?>
</html>
