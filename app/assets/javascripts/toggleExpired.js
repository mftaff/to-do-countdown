$( document ).on('turbolinks:load', function() {
    $('#toggle-expired').click(function(){
        $('#expired-tasks').toggle(100, function(){
            if($('#toggle-expired').text() === "Show Expired Tasks") {
                $('#toggle-expired').text('Hide Expired Tasks');
            } else {
                $('#toggle-expired').text('Show Expired Tasks');
            }
        });       
    });   
});
