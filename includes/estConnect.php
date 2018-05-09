<?php
//On verifie que l'utilisateur c'est bien connecté auparavant
if(isset($_SESSION['connect']))
{
}
else {
  header('Location: Index.php');
}


 ?>
