<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title></title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link rel="stylesheet" href="css/style.css">

</head>

<body>


  <div class="container">
    <br><br>
    <h1 class="text-center">Bienvenue cher visiteur<br> médical</h1>
    <div class="card card-container">
      <h2 class='login_title text-center'>Veuillez vous identifiez</h2>
      <hr style="border: none;border-bottom: 1px solid #5599EE">

      <form class="form-signin" action="identification.php" method="post">
        <p class="input_title">Visiteur matricule</p>
        <input type="text" id="inputEmail" class="login_box" name="matricule" placeholder="idGsb" required autofocus>
        <p class="input_title">Mot de Passe</p>
        <input type="password" id="inputPassword" class="login_box" name="mdp" placeholder="*********" required><br>
        <button class="btn btn-lg btn-primary" type="submit">Se connecter</button>
      </form>
      <!-- /form -->
    </div>
    <!-- /card-container -->
  </div>
  <!-- /container -->

</body>

</html>
