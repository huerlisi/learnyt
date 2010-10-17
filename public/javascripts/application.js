// learnyt

var selectables = $('#response form .possible_answer');
selectables.css('cursor', "pointer");
selectables.click(function(element) {
  $('#response_possible_answer_id').val($(this).data('id'));
  $('.possible_answer').removeClass('selected');
  $(this).addClass('selected');
});
