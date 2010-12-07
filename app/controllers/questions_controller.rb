class QuestionsController < AuthorizedController
  # Scopes
  has_scope :by_title
  has_scope :tagged_with

  # Actions
  public
  
  # Setup four answers right from the start.
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

  # Redirect to next new question after creating one.
  def create
    create! do |success, failure|
      success.html {
        redirect_to new_question_path, :notice => created_flash(:resource => resource)
      }
    end
  end
end
