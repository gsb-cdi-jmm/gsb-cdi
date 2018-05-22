<?php session_start(); ?>
<html>
<head>
	<title>formulaire MEDICAMENT</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");

echo "<h1 style=\"text-align:center\">Consultation des Medicaments</h1>";

//Requete qui va permettre d'afficher tout les médicaments
$reqSqlMed = "SELECT medNomcommercial FROM medicament";
$resultMed = $connexion->query($reqSqlMed);
$ligneMed = $resultMed->fetch();
 ?>

 <form action="consultMEDICAMENT.php" method="post">
 	Choisissez le medicament à consulter :
 	<select name="recherche">
 			<option value=""><?php
 					while ($ligneMed) {
 							$nom = $ligneMed['medNomcommercial'];
 							echo "<option value='$nom'>$nom</option>";
 							$ligneMed = $resultMed->fetch();
 					} ?></option>
 		</option>
 	</select>
 	<input type="submit" value="Envoyer">
 </form>

 <?php if (isset($_POST['recherche'])): ?>
 	<?php
 	$nom = $_POST['recherche'];
 	//Requete de recherche
 	$req = "SELECT * FROM medicament WHERE medNomcommercial = '$nom' ";
 	$rep = $connexion->query($req);
 	$ligne = $rep->fetchAll(PDO::FETCH_OBJ);//Permet de retourner un objet

 	//Affhichage du nom du practicien
 	foreach ($ligne as $key) {
 		echo "<h2>Voici les informations pour le medicament ". $key->medNomcommercial . " : </h2>";
 	}

 	 ?>


 	<table>
 		<tr>
 			<th>DEPOT LEGAL :</th>
 			<?php
 			foreach ($ligne as $key){
 				?>
 					<td><?= $key->medDepotlegal ?></td>
 				<?php
 			}
 			?>
 		</tr>
 		<tr>
 			<th>NOM COMMERCIAL :</th>
 			<?php
 			foreach ($ligne as $key){
 				?>
 					<td><?= $key->medNomcommercial ?></td>
 				<?php
 			}
 			?>
 		</tr>
 		<tr>
 			<th>FAMILLE :</th>
 			<?php
 			foreach ($ligne as $key){
				$famille = $key->famCode ;

				//Requete pour aller recuperer le nom de la famille
				$reqFam = "SELECT famLibelle FROM famille WHERE famCode = '$famille'";
				$repFam = $connexion->query($reqFam);
				$ligneFam = $repFam->fetch();
 				?>
 					<td><?=$ligneFam['0']; ?></td>
 				<?php
 			}
 			?>
 		</tr>
 		<tr>
 			<th>COMPOSITION</th>
 			<?php
 			foreach ($ligne as $key){
 				?>
 					<td><?= $key->medComposition ?></td>
 				<?php
 			}
 			?>
 		</tr>
 		<tr>
 			<th>EFFETS</th>
 			<?php
 			foreach ($ligne as $key){
 				?>
 					<td><?= $key->medEffets  ?></td>
 				<?php
 			}
 			?>
 		</tr>
 		<tr>
 			<th>CONTRE INDICICATION</th>
 			<?php
 			foreach ($ligne as $key){
 				?>
 					<td><?= $key->medContreindic ?></td>
 				<?php
 			}
 			?>
 		</tr>
 	</table>
 <?php endif; ?>
	</div>
</div>
</body>
</html>
