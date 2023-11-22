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
                    $sql = "SELECT TrovaVittorieConsecutive();";
                    $result = $conn->query($sql);
    
                    if ($result->num_rows > 0) {
                        $row = $result->fetch_assoc();
                        echo $row['TrovaVittorieConsecutive()'];
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;


                case 2:
                $sql = "SELECT * FROM ContaVittoriePiloti";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    echo '<table border="0" class="table";>
                    <tr>
                        <th>Num</th>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Vittorie</th>
                    </tr>';
                    while ($row = $result->fetch_assoc()) {
                        echo '<tr>
                        <td>' . $row['numero'] . '</td>
                        <td>' . $row['nome'] . '</td>
                        <td>' . $row['cognome'] . '</td>
                        <td>' . $row['Vittorie'] . '</td>
                         </tr> ';
                    }
                    echo '</table>';
                } 
                else {
                    echo "Nessun risultato trovato.";
                }
                break;

                case 3:
                    $sql = "SELECT * FROM ContaVittorieTeam";
                    $result = $conn->query($sql);
    
                    if ($result->num_rows > 0) {
                        echo '<table border="0" class="table";>
                        <tr>
                            <th>Team</th>
                            <th>Vittorie</th>
                        </tr>';
                        while ($row = $result->fetch_assoc()) {
                            echo '<tr>
                            <td>' . $row['NomeTeam'] . '</td>
                            <td>' . $row['Vittorie'] . '</td>
                             </tr> ';
                        }
                        echo '</table>';
                    } 
                    else {
                        echo "Nessun risultato trovato.";
                    }
                    break;

                    case 4:
                        $sql = "CALL ContaPartecipazioniAnnoFIA(2023);";
                        $result = $conn->query($sql);
        
                        if ($result->num_rows > 0) {
                            echo '<table border="0" class="table";>
                            <tr>
                                <th>Nome</th>
                                <th>Cognome</th>
                                <th>Partecipazioni</th>
                            </tr>';
                            while ($row = $result->fetch_assoc()) {
                                echo '<tr>
                                <td>' . $row['nome'] . '</td>
                                <td>' . $row['cognome'] . '</td>
                                <td>' . $row['NumeroPartecipazioni'] . '</td>
                                 </tr> ';
                            }
                            echo '</table>';
                        } 
                        else {
                            echo "Nessun risultato trovato.";
                        }
                        break;

                        case 5:
                            $sql = "SELECT * FROM ContaPodiPiloti";
                            $result = $conn->query($sql);
            
                            if ($result->num_rows > 0) {
                                echo '<table border="0" class="table";>
                                <tr>
                                    <th>Num</th>
                                    <th>Nome</th>
                                    <th>Cognome</th>
                                    <th>Podi</th>
                                </tr>';
                                while ($row = $result->fetch_assoc()) {
                                    echo '<tr>
                                    <td>' . $row['numero'] . '</td>
                                    <td>' . $row['nome'] . '</td>
                                    <td>' . $row['cognome'] . '</td>
                                    <td>' . $row['Podi'] . '</td>
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

                                        /*case 9:                            
                                                echo '<table border="0" class="table";>
                                                <tr>
                                                    <th>Num</th>
                                                    <th>Nome</th>
                                                    <th>Cognome</th>
                                                </tr>';
                                                    echo '<tr>
                                                    <td>1</td>
                                                    <td>George</td>
                                                    <td>Russell</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>2</td>
                                                    <td>Carlos</td>
                                                    <td>Sainz</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>3</td>
                                                    <td>Charles</td>
                                                    <td>Leclerc</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>4</td>
                                                    <td>Lewis</td>
                                                    <td>Hamilton</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>5</td>
                                                    <td>Lando</td>
                                                    <td>Norris</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>6</td>
                                                    <td>Fernando</td>
                                                    <td>Alonso</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>7</td>
                                                    <td>Daniel</td>
                                                    <td>Ricciardo</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>8</td>
                                                    <td>Logan</td>
                                                    <td>Sargeant</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>9</td>
                                                    <td>Valtteri</td>
                                                    <td>Bottas</td>
                                                    </tr> ';
                                                    echo '<tr>
                                                    <td>Il più alcolizzato</td>
                                                    <td>Kimi</td>
                                                    <td>Raikkonen</td>
                                                    </tr> ';
                                                    echo '<tr> <td></td> <td></td>
                                                    <td>Standing made by the stunning Laura Cecere Jenner</td>
                                                    </tr> </table>';
                                                    break;*/
                                                }
                                            
                                        

            
            $conn->close();
            ?>