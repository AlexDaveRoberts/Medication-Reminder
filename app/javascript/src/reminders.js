$(document).ready(function() {
  $("#reminder_start_date").datepicker({
    uiLibrary: "bootstrap4",
    format: "dd/mm/yyyy",
    weekStartDay: 1
  });
  $('#reminder_repeat_until').datepicker({
    uiLibrary: "bootstrap4",
    format: "dd/mm/yyyy",
    weekStartDay: 1
  });
  $('#reminder1_time').timepicker({
    uiLibrary: "bootstrap4"
  });
  $('#reminder2_time').timepicker({
    uiLibrary: "bootstrap4"
  });
});
