$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $(".question-page-answer-form").submit(function(e) {
    e.preventDefault();
    var id =
    $.ajax() {
      method: "POST"
      url: "/questions/" + id + "/answers"
    }
    .done() {

    }

    })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
