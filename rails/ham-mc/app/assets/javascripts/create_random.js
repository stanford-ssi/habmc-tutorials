
$(document).on('turbolinks:load', function () {
    $('#createRandom').on('click', function () {
        $.ajax({
            method: 'POST',
            url: '/transmissions/create_random',
            success: function () {
                setFeedback('Success');
                setTimeout(resetFeedback, 3000);
            },
            error: function () {
                setFeedback('Failure');
                setTimeout(resetFeedback, 3000);
            }
        })
    });
});

function setFeedback(text) {
    $('#feedback')
        .hide()
        .text(text)
        .slideDown();
}

function resetFeedback() {
    $('#feedback').slideUp();
}
