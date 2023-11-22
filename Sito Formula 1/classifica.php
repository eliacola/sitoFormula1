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

<body class="soloclassifica">
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


    <div class="classifica">
        <div class="piloti">
            <h1 class="med-text">Classifica Piloti</h1>

            <?php
            $servername = "localhost";
            $user = "root";
            $password = "Praisethesun17!";
            $database = "formula1";

            $conn = new mysqli($servername, $user, $password, $database);

            if ($conn->connect_error) {
                die("Connessione al database fallita: " . $conn->connect_error);
            }

            $sql = "SELECT * FROM VistaClassifica";
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
                    <td>' . $row['posizione'] . '</td>
                    <td>' . $row['nome'] . '</td>
                    <td>' . $row['cognome'] . '</td>
                    <td>' . $row['punti'] . '</td>
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

        <div class="costruttori">
            <h1 class="med-text">Classifica Costruttori</h1> 
            <?php
            $servername2 = "localhost";
            $user2 = "root";
            $password2 = "Praisethesun17!";
            $database2 = "formula1";

            $conn2 = new mysqli($servername2, $user2, $password2, $database2);

            if ($conn2->connect_error) {
                die("Connessione al database fallita: " . $conn2->connect_error);
            }

            $sql2 = "SELECT * FROM VistaClassificaCostruttori";
            $result2 = $conn2->query($sql2);

            if ($result2->num_rows > 0) {
                echo '<table border="0" class="table";>
                <tr>
                    <th>Squadra</th>
                    <th>Punti</th>
                </tr>';
                while ($row2 = $result2->fetch_assoc()) {
                    echo '<tr>
                    <td>' . $row2['squadra'] . '</td>
                    <td>' . $row2['punti'] . '</td>
                    </tr>';
                }
                echo '</table>';
            } 
            else {
                echo "Nessun risultato trovato.";
            }
            $conn2->close();
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