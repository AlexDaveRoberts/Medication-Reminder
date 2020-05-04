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

  setInterval(function() {
    var currentdate = new Date();
    var datetime = currentdate.getHours() + ":" + currentdate.getMinutes();
    var reminder_info = document.getElementsByClassName("reminder_info");
    for (var i = 0; i < reminder_info.length; i++) {
      var reminder_times = JSON.parse(reminder_info[i].getAttribute("data-times"));
      var reminder_title = reminder_info[i].getAttribute("data-medication-name");
      var reminder_type = reminder_info[i].getAttribute("data-medication-type");
      var individual_id = reminder_info[i].getAttribute("data-individual-id");
      for (var n = 0; n < reminder_times.length; n++) {
        if (reminder_times[n] == datetime) {
          if (reminder_type == "Drop") {
            document.getElementById("reminder_eye_drops").classList.remove("hidden");
          } else if (reminder_type == "Injection") {
            document.getElementById("reminder_injection").classList.remove("hidden");
          } else if (reminder_type == "Syrup") {
            document.getElementById("reminder_syrup").classList.remove("hidden");
          } else if (reminder_type == "Tablet") {
            document.getElementById("reminder_tablets").classList.remove("hidden");
          }
          document.getElementById("reminder_title").innerHTML = reminder_title + " Reminder";
          document.getElementById("reminder_content").innerHTML = `It is ${datetime}, this is your reminder to take ${reminder_title}.`;
          $('#reminder_modal').modal('show');
          document.getElementById("reminder_taken").innerHTML = `<i class='fas fa-check'></i> I have taken ${reminder_title}`;
          $('#reminder_modal').modal('show');
          document.getElementById("reminder_taken").dataset.individual_id = individual_id;

          $("#reminder_taken").click(function() {
            $.ajax({
              method: "POST",
              url: "/reminders/confirm",
              data: { individual_id: $(this).attr("data-individual_id"), time_num: n}
            })
            .done(function() {
              location.reload();
            });
          });
        }
      }
    }
  }, 60000);

  $('#reminder_modal').on('hidden.bs.modal', function () {
    location.reload();
  });
});
