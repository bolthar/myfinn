
$(document).ready(function() {

  $("#search_finn").click(function () {
    var finn_id = $("#search_finn_id").val();
    $("#search_finn").button('loading');
    $.post(
      "/apartments/create", 
      { id : finn_id }, 
      function (result) {
        if(result.status == "ok") {
          window.location.href = "/apartments/" + result.id;
        } else {
          $("#search_error").html(result.status);
          $("#search_finn").button("reset");
        }
      }
    );
  });

});

