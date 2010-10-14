class QuestionsController < InheritedResources::Base
  # Responders
  respond_to :html, :js

  protected
    def collection
      @questions ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
