<?php
session_start();

if (!isset($_SESSION['nom'])) {
    header("location: ../connexion.php");
    exit();
}

$id_produit = $_POST['produit'];
$quantite = $_POST['quantite'];
$visiteur = $_SESSION['id'];

include "../inc/functions.php";
$conn = connect();

$requete = "SELECT prix FROM produits WHERE id = '$id_produit'";
$resultat = $conn->query($requete);
$produit = $resultat->fetch();
$total = $quantite * $produit['prix'];

$date = date("Y-m-d");
$requete_panier = "INSERT INTO paniers (visiteur, total, date_creation) VALUES ('$visiteur', '$total', '$date')";
$resultat_panier = $conn->query($requete_panier);
$panier_id = $conn->lastInsertId();

$requete = "INSERT INTO commandes (quantite, total, panier, date_creation, date_modification, produit) VALUES ('$quantite', '$total', '$panier_id', '$date', '$date', '$id_produit')";
$resultat = $conn->query($requete);

header("location: ../panier.php");
exit();
?>
