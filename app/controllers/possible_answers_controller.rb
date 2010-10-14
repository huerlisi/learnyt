class PossibleAnswersController < InheritedResources::Base
  # Responders
  respond_to :html, :js

  protected
    def collection
      @possible_answers ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
