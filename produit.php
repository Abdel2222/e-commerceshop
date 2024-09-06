<?php
include "inc/functions.php";

$categories = getAllCategories();

if (isset($_GET['id'])) {
    $produit = getProduitById($_GET['id']);
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E-SHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }

        .card {
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            height: 300px; /* Modifier la hauteur selon vos besoins */
            object-fit: cover;
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 18px;
            color: #777;
            margin-bottom: 15px;
        }

        .list-group-item {
            font-size: 18px;
            font-weight: bold;
            border: none;
            background-color: transparent;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>

<body>
    <?php include "inc/header.php"; ?>

    <div class="row justify-content-center mt-5">
        <div class="col-8">
            <div class="card">
                <img src="images/<?php echo $produit['image']; ?>" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $produit['nom'] ?></h5>
                    <p class="card-text"><?php echo $produit['description'] ?>.</p>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><?php echo $produit['prix'] ?> Euro</li>
                    <?php foreach ($categories as $c) {
                        if ($c['id'] == $produit['categorie']) {
                            echo '<button class="btn btn-success">' . $c['nom'] . '</button>';
                        }
                    } ?>
                </ul>
                <div class="col-12">
                    <form class="d-flex" action="actions/commander.php" method="post">
                        <input type="hidden" name="produit" value="<?php echo $produit['id'] ?>">
                        <input type="number" class="form-control" name="quantite" step="1"
                            placeholder="Quantité du produit...">
                        <button type="submit" class="btn btn-success">Commander</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php include "inc/footer.php"; ?>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>
</body>

</html>



