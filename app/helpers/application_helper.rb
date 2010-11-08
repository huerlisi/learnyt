module ApplicationHelper

  # CRUD helpers
  def icon_link_to(action, url, options = {})
    options.merge!(:class => "icon icon-#{action}")
    
    link_to(t_action(action), url, options)
  end
  
  def contextual_link_to(action, resource_or_model = nil)
    # Handle both symbols and strings
    action = action.to_s
    
    # Resource and Model setup
    # Use controller name to guess resource or model if not specified
    case action
    when 'new', 'index'
      model = resource_or_model || controller_name.singularize.camelize.constantize
    when 'show', 'edit', 'delete'
      resource = resource_or_model || instance_variable_get("@#{controller_name.singularize}")
      model = resource.class
    end
    model_name = model.to_s.underscore
    
    # Return if current user isn't authorized to call this action
    return unless can?(action.to_sym, model)
    
    # Link generation
    case action
    when 'new'
      return icon_link_to(action, send("new_#{model_name}_path"), :remote => true)
    when 'show'
      return icon_link_to(action, send("#{model_name}_path", resource))
    when 'edit'
      return icon_link_to(action, send("edit_#{model_name}_path", resource))
    when 'delete'
      return icon_link_to(action, send("#{model_name}_path", resource), :confirm => t_confirm_delete(resource), :method => :delete)
    when 'index'
      return icon_link_to(action, send("#{model_name.pluralize}_path"))
    end
  end
  
  def contextual_links_for(action = nil, resource_or_model = nil)
    # Use current action if not specified
    action ||= action_name
    
    # Handle both symbols and strings
    action = action.to_s
    
    actions = []
    case action
    when 'new', 'create'
      actions << 'index'
    when 'show'
      actions << ['edit', 'delete', 'index']
    when 'edit', 'update'
      actions << ['show', 'delete', 'index']
    when 'index'
      actions << 'new'
    end
    
    links = actions.map{|link_for| contextual_link_to(link_for, resource_or_model)}
    
    return links.join("\n").html_safe
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
