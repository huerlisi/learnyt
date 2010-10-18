class AnswersController < InheritedResources::Base
  # Responders
  respond_to :html, :js, :json

  has_scope :by_title

  protected
    def collection
      @answers ||= end_of_association_chain.paginate(:page => params[:page])
    end
end
