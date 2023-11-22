<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formula 1</title>
</head>

<link rel="stylesheet" href="style1.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;400;600&display=swap" rel="stylesheet">

<body>
   <div class="header">
    <div class="logo">
        <img src="logo2.png" alt="">
    </div>
    <ul class="menu">
        <li><a href="home.php" class="button">Home</a></li>
        <li><a href="classifica.php" class="button">Classifiche</a></li>
        <li><a href="statistiche.php" class="button">Statistiche</a></li>
        <li><a href="info.php" class="button">Info</a></li>
    </ul>
    <div class="hamburger">
        <span></span>
        <span></span>
        <span></span>
    </div>
   </div>

    <div class="hero">
    <div class="hero__content">
        <p class="intro-text" > Prossimo GP</p>
        <?php
            $servername = "localhost";
            $user = "root";
            $password = "Praisethesun17!";
            $database = "formula1";

            $conn = new mysqli($servername, $user, $password, $database);

            if ($conn->connect_error) {
                die("Connessione al database fallita: " . $conn->connect_error);
            }

            $sql = "SELECT * FROM ProssimoGP";
            $result = $conn->query($sql);

            // Mostra i risultati
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '<h1 class="med-text">';
                    echo  "<br>" .$row["nome"];
                    echo ",  " . $row["dataGP"] . "<br>";
                    echo '</h1>';
                    echo '<p class="intro-text">';
                    echo  $row["circuito"] . ", ";
                    echo  $row["nazione"] . "<br>";
                    echo '</p>';
                }
            } else {
                echo "Nessun Gran Premio trovato.";
            }

            $conn->close();
            ?>
    </div>
    </div> 



<div class="poster">
<h3 class="med-text">Risultati</h3>
    <div class="poster__content">
        <?php
            $servername = "localhost";
            $user = "root";
            $password = "Praisethesun17!";
            $database = "formula1";

            $conn = new mysqli($servername, $user, $password, $database);

            if ($conn->connect_error) {
                die("Connessione al database fallita: " . $conn->connect_error);
            }

            $sql = "SELECT * FROM UltimoGP";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                echo '<table border="0" class="table";>
                <tr>
                    <th>Pos</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    
                    <th>Punti</th>
                </tr>';
                while ($row = $result->fetch_assoc()) {
                    echo '<tr>
                    <td>' . $row['Posizione'] . '</td>
                    <td>' . $row['NomePilota'] . '</td>
                    <td>' . $row['CognomePilota'] . '</td>
                    
                    <td>' . $row['Punteggio'] . '</td>
                    </tr> ';
                }
                echo '</table>';
            } 
            else {
                echo "Nessun risultato trovato.";
            }
            $conn->close();
            ?>
    </div>
</div>
  

<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


<script> 
$( document ).ready(function() {
  
    /* Open Panel */
    $( ".hamburger" ).on('click', function() {
      $(".menu").toggleClass("menu--open");
    });

});
</script>


</body>
</html>