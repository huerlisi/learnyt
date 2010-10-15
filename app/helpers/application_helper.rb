module ApplicationHelper

  def index_contextual_for(model)
    model_name = model.to_s.underscore
    
    render 'layouts/index_contextual_for', :model => model, :model_name => model_name
  end
end
