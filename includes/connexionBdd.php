<?php
	// Définitions de constantes pour la connexion à MySQL
	$hote="localhost";
	$login="root";
	$mdp="";
	$nombd="gsb-cr2";

	// Connection au serveur
	try {
			$connexion = new PDO("mysql:host=$hote;dbname=$nombd",$login , $mdp);
			//Modification du jeu de caractères de la connexion
			$req="SET CHARACTER SET ISO-8859-1";
			$connexion->query($req) ;
	} catch ( Exception $e ) {
		  die ("\n Connection à '$hote' impossible :  ".$e->getMessage());
	}
?>
