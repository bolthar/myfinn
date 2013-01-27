
function refreshComments(apartment_id) {
  $("#comments-container").load(
      "/comments/" + apartment_id);
}

function highlightStars(container, rating) {
  container.find(".star").each(function () {
    var star = $(this);
    if(star.attr("data-rating") <= rating){
      star.removeClass("no-point");
      star.addClass("point");
    } else { 
      star.removeClass("point");
      star.addClass("no-point");
    }
  });
}

function showAppointmentSection(apartment_id) {
  if($("#change-status").val() == "3") {
    $("#appointment-container").load("/apartments/" + apartment_id + "/appointment");
  } else {
    $("#appointment-container").html("");
  }
}

function sendCheckedData(apartment_id, statusValue) 
{
  $.post("/apartments/" + apartment_id + "/status", { value: statusValue }, function() {
    showAppointmentSection(apartment_id);
  });

}

$(document).ready(function() {
 
  $(".rating .saved").hide();
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
    if($(this).attr("href") == "#map") {
      drawMap(); //hackhackhack!
    }
  });

  refreshComments($("#apartment-id").val());

  $("#change-status").change(function () {
    sendCheckedData($("#apartment-id").val(), $(this).val());
  });

  showAppointmentSection($("#apartment-id").val())

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

  $(".rating .changeable").click(function () {
    var apt_id = $(this).attr("data-apartment-id");
    var rating = $(this).attr("data-rating");
    var container = $(this).parent();
    $.post("/apartments/" + apt_id + "/rating", { value : rating }, function (result) {
      highlightStars(container, result.rating);
      container.find(".saved").show('fast');
    });
  });

  $("#appointment_date").datepicker({ format : "dd/mm/yyyy" }).on('changeDate', function(e) {
    $("#appointment_date").datepicker('hide');
  });
  $("#appointment_time").timepicker({ showMeridian: false, minuteStep: 5});

});

