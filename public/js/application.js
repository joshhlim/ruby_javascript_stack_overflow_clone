$(document).ready(function() {
  $('.vote-button').on("click", function(e){
    e.preventDefault()
      var id = $(this).closest("article").attr("id")
      var route = $(this).parent().attr('action')

      var request = $.ajax({
        method: "post",
        url: route,
        dataType: "json"

      });
      request.done(function(response){
        console.log(typeof $('#' + id).find(".vote-button"))
        $('#' + id).find(".vote-button").removeClass("btn-success btn-xs");
        $('#' + id).find(".vote-button").addClass("btn-danger btn-xs");
        alert("You voted")
        $('#' + id).find(".count").text(response.count + " votes ||")
      })
   })

  $('div').on('click', '.question_comment', function(e){
    e.preventDefault()
    var that = $(this)
    var path = $(this).attr('href')
    $.ajax({
      url: path,
      dataType: "html"
    }).done(function(response){
      that.before(response)
    })
  });

  $('div').on('click', '.answer_comment', function(e){
    e.preventDefault()
    var that = $(this)
    var path = $(this).attr('href')
    $.ajax({
      url: path,
      dataType: "html"
    }).done(function(response){
      that.before(response)
    })
  });

  $('div').on('click', '.answer_question', function(e){
    e.preventDefault()
    var that = $(this)
    var path = $(this).attr('href')
    $.ajax({
      url: path,
      dataType: "html"
    }).done(function(response){
      that.before(response)
    })
  });

   $('.vote-answer-button').on("click", function(e){
     e.preventDefault()
       var id = $(this).closest("article").attr("id")
       var route = $(this).parent().attr('action')

       var request = $.ajax({
         method: "post",
         url: route,
         dataType: "json"

       });
       request.done(function(response){
         console.log($('#' + id).find(".count-answer"))
         $('#' + id).find(".vote-answer-button").removeClass("btn-success btn-xs");
         $('#' + id).find(".vote-answer-button").addClass("btn-danger btn-xs");
         alert("You voted")
         $('#' + id).find(".count-answer").text(response.count + " votes ||")
       })
    })
});
