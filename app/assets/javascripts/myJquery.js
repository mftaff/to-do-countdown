/*global $*/

function clearSearch() {
    $('#search').val('');
    $('#search-results').empty();    
}

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$(document).ready( function() {
    $('#search').keyup( function() {
        delay(function(){
            var $searchLen = $('#search').val().length;
            if ( $searchLen > 2 ) {
                $('#search-form').submit();
            } else if ( $searchLen === 0 ) {
                clearSearch();   
            } else if ( $searchLen === 1 || $searchLen === 2 ) {
                    $('#search-results').html("<tr><th>Showing 0 results for \" " + $('#search').val() + " \"</th><th></th><th></th></tr>");
            }     
        }, 200);
    });   
    
    $('#clear-search').click(function() {
        clearSearch();
    }); 
    
    $('#toggle-expired').click(function(){
        $('#expired-tasks').toggle(100, function(){
            $('#toggle-expired').toggleClass('redded');
            if($('#toggle-expired').text() === "Show Expired Tasks") {
                $('#toggle-expired').text('Hide Expired Tasks');
            } else {
                $('#toggle-expired').text('Show Expired Tasks');
            }
        });       
    });   
});
