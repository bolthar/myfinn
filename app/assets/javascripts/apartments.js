
function refreshComments(apartment_id) {
  $("#comments-container").load(
      "/comments/" + apartment_id);
}

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

  $("#tabcontrol a").click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  refreshComments($("#apartment-id").val());

  $("#link-add-comment").click(function () {
    $("#add-comment-error").html();
    $("#link-add-comment").button('loading');
    $.post("/comments/", 
      {
        apartment_id : $("#apartment-id").val(),
        text : $("#comment-textarea").val()
      },
      function (result) {
        if(result.status == "ok") {
          $("#link-add-comment").button('reset');
          refreshComments($("#apartment-id").val());
        } else {
          $("#add-comment-error").html(result.status);
        }
      });

  });

});

