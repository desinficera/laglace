<html>

  <head>
    <meta charset="UTF-8">
    <title></title>
  </head>
  
  <body>
    <?php
    //create two variables
    $title = filter_input(INPUT_GET, "title", FILTER_SANITIZE_STRING);
    $image = filter_input(INPUT_GET, "image", FILTER_SANITIZE_STRING);
    $price = filter_input(INPUT_GET, "price", FILTER_SANITIZE_INT);
    $ingredients = filter_input(INPUT_GET, "ingredients", FILTER_SANITIZE_STRING);
    ?>
    
<!-- display title and image of book -->
    <h2><?= title ?></h2>
    <img src="images/<?= $image ?>" style="width: 200px"/>
  </body>
</html>
