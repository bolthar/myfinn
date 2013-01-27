
$(document).ready(function () {
  $("#calendar").fullCalendar({
    aspectRatio:1.5,
    header: {
      left: 'prev, next, today',
      center: 'title',
      right: 'month, agendaWeek, agendaDay'
    },
    events: "/calendar/events",
    eventClick: function(ev) {
      window.location.href = "/apartments/" + ev.id;
    }
  });
});
