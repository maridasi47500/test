<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Accueil</title>
  </head>
  <body>
    <header>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.html">GRETA</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="formations.html">Formations</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="faq.html">FAQ</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="carte.html">Carte</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="contact.php">Contact</a>
            </li>
          </ul>
          </div>
      </nav>
    </header>
    <section>
    <?php
      if(isset($_POST['nom']))
      {
        echo "<div>";
        $name = $_POST["nom"];
        echo "</br>";
        echo "Nom :", $name;
        echo "</br></br></div>";
      }    
      if(isset($_POST['prenom']))
      {
        echo "<div>";
        $name = $_POST["prenom"];
        echo "</br>";
        echo "Prénom :", $name;
        echo "</br></br></div>";
      }    
      if (!empty($_POST["email"])) {
        echo "Yes, mail is set";    
        $to      = $_POST["email"];
        $subject = 'the subject';
        $message = 'hello' . $to . 'your registration was successful!';
        $headers = array(
          'From' => 'webmaster@example.com',
          'Reply-To' => 'webmaster@example.com',
          'X-Mailer' => 'PHP/' . phpversion()
        );

        mail($to, $subject, $message, $headers);
      } else {  
          echo "No, mail is not set";
      }

    ?>
      <p></p>
      <form method="post" action="#" name="contact">
        <p>IDENTITE</p>
        <p>Nom : <input type="text" name="nom"></p>
        <p>Prénom : <input type="text" name="prenom"></p>
        <p>E-mail : <input type="text" name="email"></p>
        <p>Telephone : <input type="text" name="tel"></p>
        <p>Ville : <input type="text" name="ville"></p>
        <p>Pays : <input type="text" name="pays"></p>
        <p>Compétences</p>
        <p>HTML : <input type="checkbox" name="html"></p>
        <p>CSS : <input type="checkbox" name="css"></p>
        <p>JS : <input type="checkbox" name="js"></p>
        <p>PHP : <input type="checkbox" name="php"></p>
        <div>
          <p>Je suis :</p>
          <div>
            Débutant : <input type="radio" name="niveau" value="debutant">
          </div>
          <div>
            Confirmé : <input type="radio" name="niveau" value="confirme">
          </div>
          <div>

            Expert : <input type="radio" name="niveau" value="expert">
          </div>
          <input name="envoyer" type="submit">
        </div>
      </form>
    </section>
    <footer>
      <div style="background-color:#515151;" class='page-section footer-section bg-grey-800'>
        <div class='row'>
            <div class='container text-center'>
              <div class="col-xs-12 col-md-12">
                <hr>
           
  
                <p class="text-subhead">
                      Copyright © 2019 DAFPIC - Tous droits réservés DAFPIC - Délégation académique à la formation professionnelle initiale et continue - Rectorat de Nice - 53, ave Cap de Croix - 06181 Nice cedex 2<br>
                      conception : <a href="#"> wiSign</a>.  | <a href='/mentions.html'> Mentions légales</a>  | <a href='/qualite.html'> Qualité</a> <br> <a href="download/cgv.pdf" target="_blank"> Conditions Générales de Vente :</a>  <a href="download/CONDITIONS GENERALES DE VENTE GRETA COTE D AZUR.pdf" target="_blank"> Greta Côte d'Azur </a> - <a href="download/CONDITIONS GENERALES DE VENTE GRETA DU VAR.pdf" target="_blank"> Greta Du Var </a> - <a href="download/CONDITIONS GENERALES DE VENTE GRETA TOURISME HOTELLERIE.pdf" target="_blank"> Greta Tourisme Hôtellerie </a> - <a href="download/CONDITIONS GENERALES DE VENTE GIP FIPAN.pdf" target="_blank"> GIP FIPAN </a> - <a href="download/CONDITIONS GENERALES DE VENTE GIP FIPAN.pdf" target="_blank"> V.A.E. </a>
                </p>
  
  
              </div>  
        </div>
           
        </div>
    </div>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>