$(document).ready(function() {
  $("#reminder_start_date").datepicker({
    uiLibrary: "bootstrap4",
    format: "dd/mm/yyyy",
    weekStartDay: 1
  });
  $("#reminder_repeat_until").datepicker({
    uiLibrary: "bootstrap4",
    format: "dd/mm/yyyy",
    weekStartDay: 1
  });
  $("#reminder1_time").timepicker({
    uiLibrary: "bootstrap4"
  });
  $("#reminder2_time").timepicker({
    uiLibrary: "bootstrap4"
  });

  $("#reminder_repeat").change(function() {
    if ($("#reminder_repeat").val() == "None") {
      $("#repeat_up_to").css("display", "none");
    } else {
      $("#repeat_up_to").css("display", "block");
    }
  });
});
