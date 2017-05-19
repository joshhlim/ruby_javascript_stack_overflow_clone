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
        $('#' + id).find(".count").text(response.count)
      })
   })

});
