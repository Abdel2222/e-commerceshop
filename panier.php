<?php
session_start();

include "inc/functions.php";

if (!isset($_SESSION['nom'])) {
    header("location: ../connexion.php");
    exit();
}

$commandes = getAllCommandes($_SESSION['id']); // Fonction pour récupérer les commandes du panier par l'ID du visiteur

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-SHOP</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <?php include "inc/header.php"; ?>
    <div class="row col-12 mt-5 p-4">
      <h1>Panier utilisateur</h1>
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Produit</th>
            <th scope="col">Quantité</th>
            <th scope="col">Total</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $totalGlobal = 0;
          foreach ($commandes as $index => $commande) {
            $num = $index + 1;
            $quantite = $commande['quantite'];
            $produit = getProduitById($commande['produit']);
            $prixProduit = $produit['prix'];
            $total = $quantite * $prixProduit;

            $totalGlobal += $total;

            echo '<tr>
              <th scope="row">' . $num . '</th>
              <td>' . $produit['nom'] . '</td>
              <td>' . $quantite . '</td>
              <td>' . $total . ' euro</td>
              <td>
                <form method="post" action="actions/supprimer_commande.php">
                  <input type="hidden" name="commande_id" value="' . $commande['id'] . '">
                  <button type="submit" class="btn btn-danger">Supprimer</button>
                </form>
              </td>
            </tr>';
          }
          ?>
        </tbody>
      </table>
      <div class="text-end">
        <h3>Total : <?php echo $totalGlobal; ?> euro</h3>
      </div>
    </div>
    <?php include "inc/footer.php"; ?>
  </body>
  <script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
    integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
    crossorigin="anonymous"
  ></script>
  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
    integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
    crossorigin="anonymous"
  ></script>
</html>
