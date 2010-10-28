class QuizResponsesController < InheritedResources::Base
  optional_belongs_to :quiz
  
  # Responders
  respond_to :html, :js

  protected
    def collection
      @quiz_responses ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
