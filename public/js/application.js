$(document).ready(function() {


// questions/index (display questions sorted by whatever user requests)
// ~ default most upvoted/trending tabs to hidden
  $(".sorted-qs").hide()
  $(".by-most-recent").show()
// ~ on tab clicks
  $(".most-recent-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-most-recent").show();
  })
  $(".highest-vote-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-highest-vote").show();
  })
  $(".trending-tab").on("click", function(e) {
    $(".sorted-qs").hide()
    $(".by-trending").show();
  })


// questions/show (submit an answer form)
// ~ default answer-form to hidden
  $(".a-form").hide()
// ~ show answer form on button click
  $(".a-form-button").click(function() {
    $(".a-form").show()
    $(this).hide()
  });
// ~ post answer to database & add to page on form submit
  $(".a-form").submit(function(e) {
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
      $(".a-form-button").show();
      $that.hide()
      $(".a-form").hide();
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

  $('body').on('submit', "form.upvote", function(event){
    event.preventDefault();
    var $votes = $(this).siblings('div.votes')
    $.ajax({
      method: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json"
    })
      .done(function(response){
        $votes.text(response)
      })
  })

  $('body').on('submit', "form.downvote", function(event){
    event.preventDefault();
    var $votes = $(this).siblings('div.votes')
    $.ajax({
      method: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: "json"
    })
      .done(function(response){
        $votes.text(response)
      })
  })

  $('body').on('click', 'a.edit-answer', function(event) {
    event.preventDefault()
    var $li = $(this).closest('li.pipe-separate')
    var $this = $(this)
    $.ajax({
      method: "GET",
      url: $(this).attr('href')
    })
      .done(function(response) {
        $this.remove()
        $li.append(response)
      })
  })

  $('body').on('submit', 'form.edit-answer', function(event){
    event.preventDefault()
    var $this = $(this)
    $.ajax({
      method: "PUT",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
      .done(function(response){
        $this.closest('div.question-answer').html(response)
        $(".answer-comment-form").hide();
      })
  })

  $('body').on('submit', 'form.delete-answer', function(event){
    event.preventDefault()
    var $this = $(this)
    $.ajax({
      method: "DELETE",
      url: $this.attr('action')
    })
      .done(function(){
        $this.closest('div.question-answer').remove()
      })
  })

  $('body').on('click', "#answer-comment-link",function(e) {
    e.preventDefault();
    $(this).siblings('.answer-comment-form').toggle();
  })

  $('body').on('submit', ".answer-comment-form", function(e) {
    e.preventDefault();
    var link = $(this).attr("action");
    var data = $(this).serialize();
    var $this = $(this)
    $.ajax({
      method: "POST",
      url: link,
      data: data
    })
    .done(function(response) {
      $this.closest(".question-answer").find("#answer-comment-ul").append(response)
      $(".answer-comment-form").hide();
    })
  })

});
