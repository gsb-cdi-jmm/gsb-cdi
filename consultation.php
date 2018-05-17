<?php session_start(); ?>
<html>
<head>
	<title>Consultation médicament</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");



echo "<h1 style=\"text-align:center\">Consultation des rapports de visite</h1>";

?>
<form action="consultation.php" method="post">
	Rechercher : <input type="text" name="recherche">
</form>

<?php if (isset($_POST['recherche'])): ?>
	<?php
	//Requete de recherche
	$req = "SELECT * FROM rapportvisite WHERE visMatricule = 'a131' ORDER BY rapNum";
	$rep = $connexion->query($req);
	$ligne = $rep->fetch();
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
			<th>Date du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo $ligne['rapDate']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Motif du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo $ligne['rapMotif']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Coefficient de confiance</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
		  while ($ligne) {
			?><td><?php echo $ligne['CoeffCOnf']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
		<tr>
			<th>Bilan du rapport</th>
			<?php
			$rep = $connexion->query($req);
			$ligne = $rep->fetch();
			while ($ligne) {
			?><td><?php echo $ligne['rapBilan']; ?></td><?php
			$ligne = $rep->fetch();
		} ?>
		</tr>
	</table>
<?php endif; ?>


<?php

include("includes/footer.php");
 ?>
</html>
