$(document).ready(function() {
  $('.upvote-button').on("click", function(e){
    e.preventDefault()
      var id = $(this).closest("article").attr("id")
      var route = $(this).parent().attr('action')

      var request = $.ajax({
        method: "post",
        url: route,
        dataType: "json"

      });
      request.done(function(response){
        $('#' + id).find(".upvote-button").css('color', 'red');
        alert("You voted")
        $('#' + id).find(".count").text(response.count)
      })
   })

});
