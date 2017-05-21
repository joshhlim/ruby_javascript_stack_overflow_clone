$(document).ready(function() {
  $(".question_votes").on("click", ".vote-button", function(e){
    e.preventDefault()
      var id = $(this).closest("article").attr("id")
      var route = $(this).parent().attr('action')

      var request = $.ajax({
        method: "post",
        url: route,
        dataType: "json"

      });
      request.done(function(response){
        $('#' + id).find(".vote-button").removeClass("btn-success btn-xs");
        $('#' + id).find(".vote-button").addClass("btn-danger btn-xs");
        alert("You voted")
        $('#' + id).find(".total").text(response.total + " votes ||")
        $('#' + id).find(".count").text(response.count + " votes ||")
      })
   });

  $('.question_votes').on("click", ".downvote-button", function(e){
    e.preventDefault()
      var id = $(this).closest("article").attr("id")
      var route = $(this).parent().attr('action')

      var request = $.ajax({
        method: "post",
        url: route,
        dataType: "json"

      });
      request.done(function(response){
        $('#' + id).find(".downvote-button").removeClass("btn-success btn-xs");
        $('#' + id).find(".downvote-button").addClass("btn-danger btn-xs");
        alert("You Downvoted")
        $('#' + id).find(".total").text(response.total + " votes ||")
        $('#' + id).find(".count").text(response.count + " votes ||")
      })
   });


  $('div').on('click', '.question_comment', function(e){
    e.preventDefault()
    var that = $(this)
    var path = $(this).attr('href')
    $.ajax({
      url: path,
      dataType: "html"
    }).done(function(response){
      that.before(response)
      that.hide()
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
      that.hide()
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
       console.log($(this))
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
         $('#' + id).find(".total-answer").text(response.total + " votes ||")
         $('#' + id).find(".count-answer").text(response.count + " votes ||")
       })
    });

   $(".downvote-answer-button").on("click", function(e){
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
         $('#' + id).find(".downvote-answer-button").removeClass("btn-success btn-xs");
         $('#' + id).find(".downvote-answer-button").addClass("btn-danger btn-xs");
         alert("You voted")
         $('#' + id).find(".total-answer").text(response.total + " votes ||")
         $('#' + id).find(".count-answer").text(response.count + " votes ||")
       })
    });

  $('.delete-button').on("click", function(e){
    e.preventDefault()
      var id = $(this).closest("article").attr("id")
      var route = $(this).closest("form").attr('action')

      var request = $.ajax({
        method: "delete",
        url: route,
        dataType: "json"

      });
      request.done(function(response){
        $('#'+ id).remove()
        alert("You deleted")
      })
   })

});
