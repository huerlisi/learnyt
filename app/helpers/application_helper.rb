module ApplicationHelper

  # CRUD helpers
  def contextual_link_to(action, model)
    model_name = model.to_s.underscore
  
    case action
    when 'new'
      link_to t_crud('new', model), send("new_#{model_name}_path"), :remote => true, :class => "icon icon-add"
    end
  end
  
  def index_contextual_for(model)
    model_name = model.to_s.underscore
    
    render 'layouts/index_contextual_for', :model => model, :model_name => model_name
  end

  def list_item_actions_for(resource)
    model_name = resource.class.to_s.underscore
    
    render 'layouts/list_item_actions_for', :model_name => model_name, :resource => resource
  end

  def show_new_form(model)
    model_name = model.to_s.underscore
    
    output = <<EOF
$('##{model_name}_list').before('#{escape_javascript(render('form'))}')
addAutofocusBehaviour()
EOF
  
    return output.html_safe
  end

  def hide_deleted_list_item(resource)
    model_name = resource.class.to_s.underscore
    
    output = <<EOF
$('##{model_name}_#{resource.id}').fadeOut("slow")
EOF
    
    return output.html_safe
  end
end
