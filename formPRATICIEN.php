<?php session_start(); ?>
<html>
<head>
	<title>formulaire PRATICIEN</title>
	<script language = "javascript">
		function chercher($pNumero) {
			var xhr_object = null;
			if(window.XMLHttpRequest) // Firefox
				xhr_object = new XMLHttpRequest();
			else if(window.ActiveXObject) // Internet Explorer
					xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
				else { // XMLHttpRequest non support� par le navigateur
					alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest...");
					return;
				}
			//traitement � la r�ception des donn�es
		   xhr_object.onreadystatechange = function() {
			if(xhr_object.readyState == 4 && xhr_object.status == 200) {
				 var formulaire = document.getElementById("formPraticien");
				formulaire.innerHTML=xhr_object.responseText;			}
		   }
		   //communication vers le serveur
		   xhr_object.open("POST", "cherchePraticien.php", true);
		   xhr_object.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		   var data = "pratNum=" + $pNumero ;
		   xhr_object.send(data);

	   }
	</script>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");
 ?>

		<h1> Praticiens </h1>
		<form name="formListeRecherche" >
			<select name="lstPrat" class="titre" onClick="chercher(this.value);">
				<option>Choisissez un praticien</option>
				<option value="1">Notini</option>
				<option value="2">Gosselin</option>
				<option value="3">Delahaye</option>
			</select>
		</form>
		<form id="formPraticien">
		</form>
	</div>
</div>
</body>
</html>
