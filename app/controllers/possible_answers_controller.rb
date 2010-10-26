class PossibleAnswersController < InheritedResources::Base
  optional_belongs_to :question
  
  # Responders
  respond_to :html, :js

  protected
    def collection
      @possible_answers ||= end_of_association_chain.paginate(:page => params[:page])
    end

  public
  def new
    @question = Question.find(params[:question_id])
    @possible_answer = @question.possible_answers.build(params[:possible_answer])
    @possible_answer.build_answer
    new!
  end
end
