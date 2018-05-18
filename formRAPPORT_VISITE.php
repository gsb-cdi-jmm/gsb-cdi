<?php
//On vérifie qu'une session n'a pas déja été ouverte afin de ne pas réouvrir
//une session en réutilisant cette page dans recupRAPPORT_VISITE.php
$status = session_status();
if ($status == PHP_SESSION_NONE) {
    //Il n'y a pas de seesion active
    session_start();
}

?>
<html>
<head>
    <title>formulaire RAPPORT_VISITE</title>
    <style type="text/css">
    </style>
    <script language="javascript">
        function selectionne(pValeur, pSelection, pObjet) {
            //active l'objet pObjet du formulaire si la valeur sélectionnée (pSelection) est égale à la valeur attendue (pValeur)
            if (pSelection === pValeur) {
                formRAPPORT_VISITE.elements[pObjet].disabled = false;
            } else {
                formRAPPORT_VISITE.elements[pObjet].disabled = true;
            }
        }
    </script>
    <script language="javascript">
        function ajoutLigne(pNumero) { //ajoute une ligne de produits/qté à la div "lignes"
            //masque le bouton en cours
            document.getElementById("but" + pNumero).setAttribute("hidden", "true");
            pNumero++; //incrémente le numéro de ligne
            var laDiv = document.getElementById("lignes"); //récupére l'objet DOM qui contient les données
            var titre = document.createElement("label"); //crée un label
            laDiv.appendChild(titre); //l'ajoute à la DIV
            titre.setAttribute("class", "titre"); //définit les propriétés
            titre.innerHTML = "   Produit : ";
            var liste = document.createElement("select"); //ajoute une liste pour proposer les produits
            laDiv.appendChild(liste);
            liste.setAttribute("name", "PRA_ECH" + pNumero);
            liste.setAttribute("class", "zone");
            //remplit la liste avec les valeurs de la premiére liste construite en PHP � partir de la base
            liste.innerHTML = formRAPPORT_VISITE.elements["PRA_ECH1"].innerHTML;
            var qte = document.createElement("select");
            laDiv.appendChild(qte);
            qte.setAttribute("name", "PRA_QTE" + pNumero);
            qte.setAttribute("size", "1");
            qte.setAttribute("class", "zone");
            qte.innerHTML = formRAPPORT_VISITE.elements["PRA_QTE1"].innerHTML;
            var bouton = document.createElement("input");
            laDiv.appendChild(bouton);
            //ajoute une gestion évenementielle en faisant évoluer le numéro de la ligne
            bouton.setAttribute("onClick", "ajoutLigne(" + pNumero + ");");
            bouton.setAttribute("type", "button");
            bouton.setAttribute("value", "+");
            bouton.setAttribute("class", "zone");
            bouton.setAttribute("id", "but" + pNumero);
        }
    </script>
<?php
include("includes/estConnect.php");
include("includes/connexionBdd.php");
include("includes/head.php");
include("includes/menu.php");

//Requete qui va nous permettre d'afficher tout les practiciens
$reqSql = "SELECT praNom, praPrenom FROM praticien";
$result = $connexion->query($reqSql);
$ligne = $result->fetch();

//Requete qui va permettre d'afficher tout les médicaments
$reqSqlMed = "SELECT medNomcommercial FROM medicament";
$resultMed = $connexion->query($reqSqlMed);
$ligneMed = $resultMed->fetch();
?>
<form name="formRAPPORT_VISITE" method="post" action="recupRAPPORT_VISITE.php">
    <div id="rapport">
        <div class="rapport-part">
            <h1> Rapport de visite </h1>
            <!-- On ajoute le numero directement grâce au nom de l'utilisateur -->
            <label class="titre">DATE VISITE :</label>
                <input type="date" size="10" name="RAP_DATEVISITE" class="zone"<?php if (isset($_POST['RAP_DATEVISITE'])) {
                    echo "value='" . $_POST['RAP_DATEVISITE'] . "'";
                } ?><br>
            <label class="titre">PRATICIEN :</label>
                <select name="PRA_NUM" class="zone">
                    <option value=""><?php
                        while ($ligne) {
                            $nom = $ligne['praNom'];
                            $prenom = $ligne['praPrenom'];
                            echo "<option value='$nom'>$nom $prenom</option>";
                            $ligne = $result->fetch();
                        } ?></option>
                </select>
            <label class="titre">REMPLACANT</label> <input type="checkbox" onClick="selectionne(true,this.checked,'PRA_REMPLACANT');"/>
            <label class="titre">MOTIF :</label>
                <select name="RAP_MOTIF" class="zone">
                    <option value=""></option>
                    <option value="PRD">Périodicité</option>
                    <option value="ACT">Actualisation</option>
                    <option value="REL">Relance</option>
                    <option value="SOL">Sollicitation praticien</option>
                    <option value="AUT">Autre</option>
                </select>
            <label class="titre">BILAN :</label>
                <textarea rows="5" cols="50" name="RAP_BILAN" class="zone"></textarea>
            <label class="titre">COEFFICIENT DE CONFIANCE :</label>
                <select name="CoeffConf">
                  <option value=""></option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
        </div>
        <div class="rapport-part">
          <h3><label class="titre"> Eléments présentés</label></h3>
            <label class="titre">PRODUIT 1 :</label>
                <select name="PROD1" class="zone">
                    <option value="*">
                        <?php
                        while ($ligneMed) {
                            $medNom = $ligneMed['medNomcommercial'];
                            echo "<option value='$medNom'>$medNom</option>";
                            $ligneMed = $resultMed->fetch();
                        }
                        ?>
                    </option>
                </select>

            <label class="titre">PRODUIT 2 : (Seulement si présenté)</label>
                <select name="PROD2" class="zone">
                    <option value="*">
                        <?php
                        //On reinitialise la liste de medicament au début pour pouvoir les afficher de nouveau
                        $resultMed2 = $connexion->query($reqSqlMed);
                        $ligneMed2 = $resultMed2->fetch();
                        while ($ligneMed2) {
                            $medNom = $ligneMed2['medNomcommercial'];
                            echo "<option value='$medNom'>$medNom</option>";
                            $ligneMed2 = $resultMed2->fetch();
                        }
                        ?>
                    </option>
                </select>
            <label class="titre"><h3>Echanitllons</h3></label>
            <div class="titre" id="lignes">
                <label class="titre">Produit :</label>
                <select name="PRA_ECH1" class="zone">
                    <option value="*">
                        <?php
                        //On reinitialise la liste de medicament au début pour pouvoir les afficher de nouveau
                        $resultMed2 = $connexion->query($reqSqlMed);
                        $ligneMed2 = $resultMed2->fetch();
                        while ($ligneMed2) {
                            $medNom = $ligneMed2['medNomcommercial'];
                            echo "<option value='$medNom'>$medNom</option>";
                            $ligneMed2 = $resultMed2->fetch();
                        }
                        ?>
                    </option>
                </select>
                <select name="PRA_QTE1" size="1" class="zone">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
                <input type="button" id="but1" value="+" onclick="ajoutLigne(1);" class="zone"/>
            </div>
            <label class="titre"></label>Confirmation
                <input type="reset" value="annuler"/>
                <input type="submit"/>

        </div>
    </div>
</form>
</body>
</html>
