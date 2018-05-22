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
	$nom = $_POST['recherche'];
	//Requete de recherche
	$req = "SELECT * FROM praticien WHERE praNom = '$nom' ";
	$rep = $connexion->query($req);
	$ligne = $rep->fetchAll(PDO::FETCH_OBJ);//Permet de retourner un objet

	//Affhichage du nom du practicien
	foreach ($ligne as $key) {
		echo "<h2>Voici les informations pour ". $key->praNom . " " .$key->praPrenom . " : </h2>";
	}


	 ?>


	<table>
		<tr>
			<th>Nom</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praNom ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Prenom</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praPrenom ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Type de praticien</th>
			<?php
			foreach ($ligne as $key){
				$code = $key->typCode;

				//Requete pour recuperer le code de famille de practicien
				$reqCode = "SELECT typLibelle FROM typepraticien WHERE typCode = '$code'";

				$repCode = $connexion->query($reqCode);
				$ligneCode = $repCode->fetch();
				?>
					<td><?= $ligneCode['0']; ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Lieu de Travail</th>
			<?php
			foreach ($ligne as $key){
				$code = $key->typCode;

				//Requete pour recuperer le code de famille de practicien
				$reqCode = "SELECT typLieu FROM typepraticien WHERE typCode = '$code'";

				$repCode = $connexion->query($reqCode);
				$ligneCode = $repCode->fetch();
				?>
					<td><?= $ligneCode['0']; ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Adresse</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praAdresse ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Code Postal</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praCp ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Ville</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praVille  ?></td>
				<?php
			}
			?>
		</tr>
		<tr>
			<th>Coefficient de notoriété</th>
			<?php
			foreach ($ligne as $key){
				?>
					<td><?= $key->praCoefnotoriete ?></td>
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
