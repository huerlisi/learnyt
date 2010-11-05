class PossibleAnswersController < AuthorizedController
  # Associations
  optional_belongs_to :question
  
  # Responders
  respond_to :html, :js

  # Actions
  public
  def new
    @question = Question.find(params[:question_id])
    @possible_answer = @question.possible_answers.build(params[:possible_answer])
    @possible_answer.build_answer
    new!
  end
end
