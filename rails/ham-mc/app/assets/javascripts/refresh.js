
function updateFromTransmission(transmission) {
    $('#altitude').text(transmission.altitude + 'm');
    $('#latitude').text(transmission.latitude);
    $('#longitude').text(transmission.longitude);
    $('#temperature').text(transmission.temperature + '°C');
}

function refreshTransmissions() {
    $.ajax({
        method: 'GET',
        url: '/transmissions/last.json',
        success: function (transmission) {
            updateFromTransmission(transmission);

            setTimeout(refreshTransmissions, 1000);
        },
        error: function () {
            alert('Error pulling latest transmission')
        }
    })
}

$(document).on('turbolinks:load', refreshTransmissions);
