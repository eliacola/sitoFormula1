<?php
            //Connessione al database
            $servername = "localhost";
            $user = "root";
            $password = "Praisethesun17!";
            $database = "formula1";


            $conn = new mysqli($servername, $user, $password, $database);
            if ($conn->connect_error) {
                die("Connessione al database fallita: " . $conn->connect_error);
            }

            // Ricevi l'ID della cella cliccata
            $circleId = $_POST['circleId'];    

            switch($circleId){
                case 1:
                    $sql = "SELECT * from GRANPREMIO ORDER BY dataGP";
                    $result = $conn->query($sql);
    
                    if ($result->num_rows > 0) {
                        echo '<table border="0" class="table";>
                        <tr>
                            <th>Nome</th>
                            <th>Data</th>
                            <th>Circuito</th>
                            <th>Nazione</th>
                        </tr>';
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>
                            <td>' . $row['nome'] . '</td>
                            <td>' . $row['dataGP'] . '</td>
                            <td>' . $row['circuito'] . '</td>
                            <td>' . $row['nazione'] . '</td>
                             </tr> ';
                        }
                        echo '</table>';
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;


                case 2:
                $sql = "SELECT * FROM PILOTA";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    echo '<table border="0" class="table";>
                    <tr>
                        <th>Num</th>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Nazionalità</th>
                        <th>Data di Nascita</th>
                    </tr>';
                    while ($row = $result->fetch_assoc()) {
                        echo '<tr>
                        <td>' . $row['numero'] . '</td>
                        <td>' . $row['nome'] . '</td>
                        <td>' . $row['cognome'] . '</td>
                        <td>' . $row['nazionalita'] . '</td>
                        <td>' . $row['data_di_nascita'] . '</td>
                         </tr> ';
                    }
                    echo '</table>';
                } 
                else {
                    echo "Nessun risultato trovato.";
                }
                break;

                case 3:
                    $sql = "SELECT * FROM TEAM";
                    $result = $conn->query($sql);
    
                    if ($result->num_rows > 0) {
                        echo '<table border="0" class="table";>
                        <tr>
                            <th>Nome</th>
                            <th>Sede</th>
                            <th>Nazionalità</th>
                            <th>Team Principal</th>
                        </tr>';
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>
                            <td>' . $row['nome'] . '</td>
                            <td>' . $row['sede'] . '</td>
                            <td>' . $row['nazionalita'] . '</td>
                            <td>' . $row['team_principal'] . '</td>
                             </tr> ';
                        }
                        echo '</table>';
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;

                case 4:
                    $sql = "SELECT * FROM FIA";
                    $result = $conn->query($sql);
        
                    if ($result->num_rows > 0) {
                        echo '<table border="0" class="table";>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Cognome</th>
                            <th>Ruolo</th>
                        </tr>';
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>
                            <td>' . $row['ID'] . '</td>
                            <td>' . $row['nome'] . '</td>
                            <td>' . $row['cognome'] . '</td>
                            <td>' . $row['ruolo'] . '</td>
                            </tr> ';
                        }
                        echo '</table>';
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;

                case 5:
                    $sql = "SELECT * FROM MACCHINA";
                    $result = $conn->query($sql);
            
                    if ($result->num_rows > 0) {
                        echo '<table border="0" class="table";>
                        <tr>
                            <th>Nome</th>
                            <th>Power Unit</th>
                        </tr>';
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>
                            <td>' . $row['nome'] . '</td>
                            <td>' . $row['power_unit'] . '</td>
                            </tr> ';
                            }
                            echo '</table>';
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;

                            case 6:
                                $sql = "SELECT * FROM ContaPodiTeam";
                                $result = $conn->query($sql);
                
                                if ($result->num_rows > 0) {
                                    echo '<table border="0" class="table";>
                                    <tr>
                                        <th>Team</th>
                                        <th>Podi</th>
                                    </tr>';
                                    while ($row = $result->fetch_assoc()) {
                                        echo '<tr>
                                        <td>' . $row['NomeTeam'] . '</td>
                                        <td>' . $row['Podi'] . '</td>
                                         </tr> ';
                                    }
                                    echo '</table>';
                                } 
                                else {
                                    echo "Nessun risultato trovato.";
                                }
                                break;

                                case 7:
                                    $sql = "SELECT * FROM MediaPuntiPilota";
                                    $result = $conn->query($sql);
                    
                                    if ($result->num_rows > 0) {
                                        echo '<table border="0" class="table";>
                                        <tr>
                                            <th>Num</th>
                                            <th>Nome</th>
                                            <th>Cognome</th>
                                            <th>Media Punti</th>
                                        </tr>';
                                        while ($row = $result->fetch_assoc()) {
                                            echo '<tr>
                                            <td>' . $row['numero'] . '</td>
                                            <td>' . $row['nome'] . '</td>
                                            <td>' . $row['cognome'] . '</td>
                                            <td>' . $row['media_punti'] . '</td>
                                             </tr> ';
                                        }
                                        echo '</table>';
                                    } 
                                    else {
                                        echo "Nessun risultato trovato.";
                                    }
                                    break;

                                    case 8:
                                        $sql = "SELECT * FROM MediaPuntiFuoriPodio";
                                        $result = $conn->query($sql);
                        
                                        if ($result->num_rows > 0) {
                                            echo '<table border="0" class="table";>
                                            <tr>
                                                <th>Num</th>
                                                <th>Nome</th>
                                                <th>Cognome</th>
                                                <th>Media Fuori dal Podio</th>
                                            </tr>';
                                            while ($row = $result->fetch_assoc()) {
                                                echo '<tr>
                                                <td>' . $row['numero'] . '</td>
                                                <td>' . $row['nome'] . '</td>
                                                <td>' . $row['cognome'] . '</td>
                                                <td>' . $row['MediaPuntiFuoriPodio'] . '</td>
                                                </tr> ';
                                            }
                                            echo '<tr> <td>Idea di Ricchad</td> </tr>
                                            </table>';
                                        } 
                                        else {
                                            echo "Nessun risultato trovato.";
                                        }
                                        break;

                                        
                                }
                                            
                                        

            
            $conn->close();
            ?>