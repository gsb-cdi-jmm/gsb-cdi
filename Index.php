
   <?php
   session_start();
   if(isset($_SESSION['connect']))
   {
     header('Location: formRAPPORT_VISITE.php');
   }
   include("includes/connexionBdd.php");
   include("includes/head.php");
   include("includes/menu.php");
    ?>
    
<div class="#" style="">

</div>
<div class="DAccueil"  style="text-align:center;">
  <h1 style="margin-top:10%">Bienvenue chez GSB</h1>
    <a href="login.php"><button type="button" name="button">Se connecter</button></a>
</div>

</div>



</div>
</div>

</body>
</html>
