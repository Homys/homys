$(document).on('ready page:load', function() {

  $(".progress_bar")
  
  .on('ajax:beforeSend', function() { // set this code to happen just before the ajax request is made
    $(".progress") // make changes to the submit button
            .css("visibility", "visible");
        })

        .on('ajax:complete', function() {
           $(".progress") // make changes to the submit button
            .css("visibility", "hidden");
        });
  });
