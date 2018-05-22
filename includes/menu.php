</head>

<body>
<div name="haut" style="margin : 50px ;height:6%;">
    <img src="images/gsb2.png" width="100" height="60"/>
    <h1 style="display:inline">Gestion des visites</h1>
    <?php if (isset($_SESSION['connect'])): ?>
        <h2 style="float:right">Bienvenue <?= $_SESSION['prenom'] ?></h2>
    <?php endif; ?>
</div>
<div class="menu">
    <div name="gauche" style="float:left;min-width:10%;background-color:#282828;">
        <?php if (isset($_SESSION['connect'])): ?>
            <h2>Outils</h2>
            <ul>
                <li>Comptes-Rendus</li>
                <ul>
                    <li><a href="formRAPPORT_VISITE.php">Nouveaux</a></li>

                </ul>
            </ul>
            <ul>
              <li>Consulter</li>
              <ul>
                <li><a href="#">Medicaments</a></li>
                <li><a href="consultPRATICIEN.php">Practicien</a></li>
                <li><a href="consultation.php">Compte rendu</a></li>
              </ul>
            </ul>
            <ul>
              <li style="border:2px solid white; padding:1px 1px 1px 5px;margin-top:10px;">
                <a href="deconnexion.php" onclick="javascript: return deconnexion()" style="text-decoration:none;color:white;">Se deconnecter</a>
              </li>
            </ul>



        <?php endif; ?>
    </div>
    <div name="droite" style="float:left;min-width:80%;height:80%">
        <div name="bas" style="margin : 10px 2px 2px 2px;clear:left;background-color:#d7dcf2;padding:5;padding-left:15px;color:#5599EE;min-height:88%;/">
