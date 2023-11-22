
$(document).ready(function() {
    // Quando un cerchio viene cliccato
    $(".carousel-cell").on('click', function() {
        var circleId = $(this).data('id'); // Ottieni l'ID del cerchio cliccato

        // Esegui una richiesta AJAX per ottenere i dati in base all'ID del cerchio
        $.ajax({
            url: 'statsquery.php', // URL del tuo script PHP per elaborare la query
            method: 'POST',
            data: { circleId: circleId }, // Invia l'ID del cerchio al server
            success: function(response) {
                console.log(response); // Esegui l'azione desiderata con i dati ricevuti
                // Seleziona l'elemento in cui vuoi mostrare la tabella
                var tableContainer = $('#table-container');

                if(circleId == 1){
                    tableContainer.empty();
                    tableContainer.append(response);
                }
                else{
                     // Crea un elemento div nascosto
                    var div = document.createElement('div');
                    div.style.display = 'none';
                    // Assegna la stringa HTML come contenuto del div
                    div.innerHTML = response;

                    // Ottieni la tabella dall'elemento appena creato
                    var table = div.querySelector('table');

                    // Inserisci la tabella nel contenitore desiderato
                    var tableContainer = $('#table-container');
                    tableContainer.empty();
                    tableContainer.html('');
                    tableContainer.append(table);
                }
            },
                error: function(xhr, status, error) {
                    // Gestisci eventuali errori durante la richiesta AJAX
                    console.error(error);
                }
        });
        $('#table-container').addClass('show');
        $('.close-btn').addClass('show');
        $('#overlay').show();
    });
});
