$(document).ready(function() {

// questions/show (submit an answer form)
// ~ default answer-form to hidden
  $(".question-page-answer-form").hide()
// ~ show answer form on button click
  $("#question-page-answer-button").click(function() {
    $(".question-page-answer-form").show()
    $(this).hide()
  });
// ~ post answer to database & add to page on form submit
  $(".question-page-answer-form").submit(function(e) {
    e.preventDefault();
    var link = $(this).attr("action");
    var data = $(this).serialize();
    var $that = $(this)
    $.ajax({
      method: "POST",
      url: link,
      data: data,
      dataType: "html"
    })
    .done(function(response){
      // ~ add new answer to page
      $(".question-answers").append(response);
      // ~ rehide form, reshow answer button
      $("#question-page-answer-button").show();
      $that.hide()
    })
  });


  $("#question-comment-form").hide();
  $(".answer-comment-form").hide();

  $("#question-comment-link").click(function(e) {
    e.preventDefault();
    $("#question-comment-form").show();
  });



  $("#question-comment-form").submit(function(e) {
    e.preventDefault();
    var link = $(this).attr("action");
    var data = $(this).serialize();
    console.log(link)
    $.ajax({
      method: "POST",
      url: link,
      data: data
    })
    .done(function(response) {
      $("#question-comment-ul").prepend(response)
      $("#question-comment-form").hide();
    })
  })

  $("#answer-comment-link").click(function(e) {
    e.preventDefault();
    $(this).parent().find(".answer-comment-form").show();
  })

  $(".answer-comment-form").submit(function(e) {
    e.preventDefault();
    var link = $(this).attr("action");
    var data = $(this).serialize();
    $.ajax({
      method: "POST",
      url: link,
      data: data
    })
    .done(function(response) {
      $("#answer-comment-ul").prepend(response)
      $(".answer-comment-form").hide();
    })
  })
});
