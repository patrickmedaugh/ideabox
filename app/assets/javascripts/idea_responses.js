$(document).ready(function() {
  fetchIdeas();
  bindCreateidea();

});
function fetchIdeas() {
    $.getJSON('/api/ideas').then(function(ideas) {
      var renderedIdeas = ideas.map(renderIdea);
      $('#ideas').html(renderedIdeas);
    });
};

function renderIdea(idea, id) {
  return $("<p>" + idea.title + "</p>" +
           "<p>" + idea.body + "</p>" +
           "<p>" + idea.quality + "</p>")
}

function bindCreateidea() {

  var $title = $('#idea_title').val();
  var $body = $('#idea_body').val();
  var $submit = $('.new-idea');

  $submit.on('click', function(event) {
    event.preventDefault();
    console.log($title)
    console.log($body)
    $.post('/api/ideas', {
      title: $title.val(),
      body: $body.val(),
    }).then(appendIdea)
  });

};

function appendIdea() {
  var ideaMarkup = renderIdea(data)
  $(ideaMarkup).appendTo('#ideas');
};



// $('.new-idea').click(function() {
//   event.preventDefault();
//   $title   = $('#idea_title').val();
//   $body    = $('#idea_body').val();
//   newIdea = {
//     title: $title,
//     body: $body,
//     quality: 'swill'
//   }
//   // $.ajax({
//   //   url: '/ideas',
//   //   type: 'POST',
//   //   data: newIdea,
//   //   dataType: 'json',
//   //   success: function(data) {
//   //     console.log(data);
//   //   }
//   // })
//   $.post('/ideas', {}, function() {
//     console.log(data);
//   });
// });
