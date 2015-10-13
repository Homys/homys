$(document).on('ready page:load', function() {
  $("#modal-1").on("change", function() {

    if ($(this).is(":checked")) {
      console.log('addclass modal-open');
      $("body").addClass("modal-open");
    } else {
      console.log('removeclass modal-open');
      $("body").removeClass("modal-open");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    console.log('Im here');
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });
});