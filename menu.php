<?php
//  Author: Ade A, Marcel G, Jennifer K, John L
//  Date: 7 November 2016
//  Description: Menu page

//initialize title variable
$page_title = "Our Menu"

//link to external header file
require('includes/header.php');
?>

<!-- page specific content begins -->
<h2>Our Menu</h2>
<p>Feel free to click on the product names to learn more about the flavor!</p>
<!-- insert hyperlinks -->
  <a href="icdetails.php?title=Strawberry Ice Cream&image=strawberry.jpg">Strawberry Ice Cream</a>
  <a href="icdetails.php?title=Chocolate Cookies&image=chocolatecookies.jpg">Chocolate Cookies</a>
  <a href="icdetails.php?title=Cappuccino&image=cappuccino.jpg">Cappuccino</a>
  <a href="icdetails.php?title=French Vanilla&image=frenchvanilla.jpg">French Vanilla</a>
  <a href="icdetails.php?title=Rocky Road&image=rockyroad.jpg">Rocky Road</a>
<!-- create variables -->
<?php

?>
<!-- page specific content ends -->

<?php
//link to external footer file
require("includes/footer.php");
?>
