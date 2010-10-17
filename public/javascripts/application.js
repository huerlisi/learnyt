// learnyt

var selectables = $('#response form .possible_answer');
selectables.css('cursor', "pointer");
selectables.click(function(element) {
  $('#response_possible_answer_id').val($(this).data('id'));
  $('.possible_answer').removeClass('selected');
  $(this).addClass('selected');
});

$(".sortable").bind('sortupdate', function(event, ui) {
  $(this).find('li.possible_answer').each(function(index, element) {
    $(this).find("input[id$='_position']").val(index + 1)
  });
});

function setCorrectness(element) {
  var container = element.closest('li');
  var score = element.val();

  var correctness = 'close';
  if (score == 1.0) {
    correctness = 'correct';
  } else if (score == 0.0) {
    correctness = 'wrong';
  };

  element.removeClass('close correct wrong');
  container.removeClass('close correct wrong');
  element.addClass(correctness);
  container.addClass(correctness);
}

$("form .score input").change(function(event) {
  setCorrectness($(this));
});

$("form .score input").each(function() {
  setCorrectness($(this));
});
