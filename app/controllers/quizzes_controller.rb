class QuizzesController < InheritedResources::Base
  # Responders
  respond_to :html, :js

  protected
    def collection
      @quizzes ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
