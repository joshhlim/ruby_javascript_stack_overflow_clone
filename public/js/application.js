$(document).ready(function() {
  $("#question-comment-form").hide();
  $(".answer-comment-form").hide();

  $("#question-comment-link").click(function(e) {
    e.preventDefault();
    $("#question-comment-form").show();
  })

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
