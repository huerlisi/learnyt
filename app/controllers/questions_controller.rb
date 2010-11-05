class QuestionsController < AuthorizedController
  # Scopes
  has_scope :by_title

  # Actions
  public
  def new
    @question = Question.new(params[:question])
    @question.possible_answers.build([
      { :score => 1, :position => 1, :answer => Answer.new },
      { :score => 0, :position => 2, :answer => Answer.new },
      { :score => 0, :position => 3, :answer => Answer.new },
      { :score => 0, :position => 4, :answer => Answer.new }
    ])
    
    new!
  end
end
