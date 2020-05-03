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
  $("#reminder3_time").timepicker({
    uiLibrary: "bootstrap4"
  });
  $("#reminder4_time").timepicker({
    uiLibrary: "bootstrap4"
  });

  $("#reminder_repeat").change(function() {
    if ($("#reminder_repeat").val() == "None") {
      $("#repeat_up_to").addClass("hidden");
    } else {
      $("#repeat_up_to").removeClass("hidden");
    }
  });

  $("#num_of_times1").click(function() {
    $("#no_reminders").addClass("hidden");
    $("#reminder1").removeClass("hidden");
    $("#reminder2").addClass("hidden");
    $("#reminder3").addClass("hidden");
    $("#reminder4").addClass("hidden");
  });
  $("#num_of_times2").click(function() {
    $("#no_reminders").addClass("hidden");
    $("#reminder1").removeClass("hidden");
    $("#reminder2").removeClass("hidden");
    $("#reminder3").addClass("hidden");
    $("#reminder4").addClass("hidden");
  });
  $("#num_of_times3").click(function() {
    $("#no_reminders").addClass("hidden");
    $("#reminder1").removeClass("hidden");
    $("#reminder2").removeClass("hidden");
    $("#reminder3").removeClass("hidden");
    $("#reminder4").addClass("hidden");
  });
  $("#num_of_times4").click(function() {
    $("#no_reminders").addClass("hidden");
    $("#reminder1").removeClass("hidden");
    $("#reminder2").removeClass("hidden");
    $("#reminder3").removeClass("hidden");
    $("#reminder4").removeClass("hidden");
  });

  $(".confirm_time").click(function() {
    $.ajax({
      method: "POST",
      url: "/reminders/confirm",
      data: { individual_id: $(this).attr("data-individual-id"), time_num: $(this).attr("data-time-num") }
    })
    .done(function() {
      location.reload();
    });
  });
});
