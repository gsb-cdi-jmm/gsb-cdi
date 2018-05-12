<?php session_start(); ?>
<html>
<head>
	<title>formulaire MEDICAMENT</title>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");
 ?>
	<form name="formMEDICAMENT" method="post" action="recupMEDICAMENT.php">
		<h1> Pharmacopee </h1>
		<label class="titre">DEPOT LEGAL :</label><input type="text" size="10" name="MED_DEPOTLEGAL" class="zone" />
		<label class="titre">NOM COMMERCIAL :</label><input type="text" size="25" name="MED_NOMCOMMERCIAL" class="zone" />
		<label class="titre">FAMILLE :</label><input type="text" size="3" name="FAM_CODE" class="zone" />
		<label class="titre">COMPOSITION :</label><textarea rows="5" cols="50" name="MED_COMPOSITION" class="zone" ></textarea>
		<label class="titre">EFFETS :</label><textarea rows="5" cols="50" name="MED_EFFETS" class="zone" ></textarea>
		<label class="titre">CONTRE INDIC. :</label><textarea rows="5" cols="50" name="MED_CONTREINDIC" class="zone" ></textarea>
		<label class="titre">PRIX ECHANTILLON :</label><input type="text" size="7" name="MED_PRIXECHANTILLON" class="zone" />
		<label class="titre">&nbsp;</label><input class="zone" type="button" value="<"></input><input class="zone" type="button" value=">"></input>
	</form>
	</div>
</div>
</body>
</html>
