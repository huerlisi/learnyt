// learnyt

$('#response form .possible_answer').click(function(element) {
  $('#response_possible_answer_id').val($(this).data('id'));
  $('.possible_answer').removeClass('selected');
  $(this).addClass('selected');
});
