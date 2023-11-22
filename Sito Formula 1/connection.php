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
    //echo "Posizione " ."Nome " ."Cognome" ."Punti" ."<br>";
    while ($row = $result->fetch_assoc()) {
        echo $row ['posizione'] ." " .$row ['nome'] ." " .$row ['cognome'] ." " .$row ['punti'] ."<br>";
    }
} else {
    echo "Nessun risultato trovato.";
}

?>