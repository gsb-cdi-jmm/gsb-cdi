</head>

<body>
<div name="haut" style="margin : 50 ;height:6%;">
    <img src="images/gsb2.png" width="100" height="60"/>
    <h1 style="display:inline">Gestion des visites</h1>
    <?php if (isset($_SESSION['connect'])): ?>
        <h2 style="float:right">Bienvenue <?= isset($_SESSION['prenom']) ?></h2>
    <?php endif; ?>
</div>

<div name="gauche" style="float:left;width:10%; background-color:#282828; height:100%;">
    <?php if (isset($_SESSION['connect'])): ?>
        <h2>Outils</h2>
        <ul>
            <li>Comptes-Rendus</li>
            <ul>
                <li><a href="formRAPPORT_VISITE.php">Nouveaux</a></li>
                <li><a href="consultation.php">Consulter</a></li>
            </ul>
            <li>Consulter</li>
            <ul>
                <li><a href="formMEDICAMENT.php">Médicaments</a></li>
                <li><a href="formPRATICIEN.php">Praticiens</a></li>
                <li><a href="formVISITEUR.php">Autres visiteurs</a></li>
            </ul>
        </ul>

    <?php endif; ?>
</div>
<div name="droite" style="float:left;width:80%; height:80%">
    <div name="bas" style="margin : 10px 2px 2px 2px;clear:left;background-color:#d7dcf2;padding:5px;padding-left:15px;color:#5599EE;min-height:88%;">
