class ResponsesController < InheritedResources::Base
  optional_belongs_to :question
  
  # Responders
  respond_to :html, :js

  protected
    def collection
      @responses ||= end_of_association_chain.paginate(:page => params[:page])
    end

  # Actions
  public
end
