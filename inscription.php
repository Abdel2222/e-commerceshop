<?php
session_start();
if(isset($_SESSION['nom'])){
    header('location:profile.php');
}

include "inc/functions.php";
$showRegistrationAlert = 0;


$categories = getAllCategories();
if (!empty($_POST)) { //click sur save
  if (Addvisiteur($_POST)) {
    $showRegistrationAlert = 1;
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>E-SHOP</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.16.6/sweetalert2.min.css">
</head>

<body>
  <?php
  include "inc/header.php";
  ?>
  <div class="col-12 p-5">
    <h1 class="text-center">Inscription</h1>
    <form action="inscription.php" method="post">
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Nom</label>
        <input type="text" class="form-control" name="nom" id="exampleInputPassword1">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Prenom</label>
        <input type="text" class="form-control" name="prenom" id="exampleInputPassword1">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Gsm</label>
        <input type="text" name="gsm" class="form-control" id="exampleInputPassword1">
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Mot de passe</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1">
      </div>

      <button type="submit" class="btn btn-primary">Save</button>
    </form>
  </div>
  <?php 
include "inc/footer.php";
?>
     

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.16.6/sweetalert2.all.min.js"></script>

<?php
if ($showRegistrationAlert == 1) {
  print "  <script> 
      Swal.fire({
       title: 'Sucess!',
       text: 'compte creer avec succes',
       icon: 'success',
       confirmButtonText: 'Cool',
       timer:2000
     })
       </script>
       ";
}

?>


</html>