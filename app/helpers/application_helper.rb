module ApplicationHelper

  # CRUD helpers
  def contextual_link(action, url, options = {})
    options.merge!(:class => "icon icon-#{action}")
    
    link_to(t_action(action), url, options)
  end
  
  def contextual_link_to(action, resource_or_model)
    # Handle both symbols and strings
    action = action.to_s
    
    # Resource and Model setup
    case action
    when 'new', 'index'
      model = resource_or_model
    when 'show', 'edit', 'delete'
      resource = resource_or_model
      model = resource.class
    end
    model_name = model.to_s.underscore
    
    # Return if current user isn't authorized to call this action
    return unless can?(action.to_sym, model)
    
    # Link generation
    case action
    when 'new'
      return contextual_link(action, send("new_#{model_name}_path"), :remote => true)
    when 'show'
      return contextual_link(action, send("#{model_name}_path", resource))
    when 'edit'
      return contextual_link(action, send("edit_#{model_name}_path", resource))
    when 'delete'
      return contextual_link(action, send("#{model_name}_path", resource), :confirm => t_confirm_delete(resource), :method => :delete)
    when 'index'
      return contextual_link(action, send("#{model_name.pluralize}_path"))
    end
  end
  
  def index_contextual_for(model)
    model_name = model.to_s.underscore
    
    render 'layouts/index_contextual_for', :model => model
  end

  def new_contextual_for(model)
    model_name = model.to_s.underscore
    
    render 'layouts/new_contextual_for', :model => model
  end

  def show_contextual_for(resource)
    model = resource.class
    model_name = model.to_s.underscore
    
    render 'layouts/show_contextual_for', :resource => resource, :model => model
  end

  def edit_contextual_for(resource)
    model = resource.class
    model_name = model.to_s.underscore
    
    render 'layouts/edit_contextual_for', :resource => resource, :model => model
  end

  def list_item_actions_for(resource)
    model_name = resource.class.to_s.underscore
    
    render 'layouts/list_item_actions_for', :model_name => model_name, :resource => resource
  end

  def show_new_form(model)
    model_name = model.to_s.underscore
    
    output = <<EOF
$('##{model_name}_list').replaceWith('#{escape_javascript(render('form'))}');
addAutofocusBehaviour();
addAutocompleteBehaviour();
addNestedFormsBehaviour();
addCorrectnessIndicatorBehaviour();
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
