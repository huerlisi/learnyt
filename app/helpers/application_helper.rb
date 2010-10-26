module ApplicationHelper

  # CRUD helpers
  def contextual_link(action, url, options = {})
    output = ActiveSupport::SafeBuffer.new
    options.merge!(:class => "icon icon-{#action}")
    
    output << link_to(t_action(action), url, options)
  end
  
  def contextual_link_to(action, resource_or_model)
    output = ActiveSupport::SafeBuffer.new
    
    case action
    when 'new'
      model = resource_or_model
      model_name = model.to_s.underscore
      output << link_to(t_action('new'), send("new_#{model_name}_path"), :remote => true, :class => "icon icon-add")
    when 'show'
      resource = resource_or_model
      model = resource.class
      model_name = model.to_s.underscore

      output << link_to(t_action('show'), send("#{model_name}_path", resource), :class => "icon icon-show")
    when 'edit'
      resource = resource_or_model
      model = resource.class
      model_name = model.to_s.underscore

      output << link_to(t_action('edit'), send("edit_#{model_name}_path", resource), :class => "icon icon-edit")
    when 'delete'
      resource = resource_or_model
      model = resource.class
      model_name = model.to_s.underscore

      output << link_to(t_action('delete'), send("#{model_name}_path", resource), :confirm => t_confirm_delete(resource), :method => :delete, :class => "icon icon-delete")
    when 'index'
      model = resource_or_model
      model_name = model.to_s.underscore
    
      output << link_to(t_action('index'), send("#{model_name.pluralize}_path"), :class => "icon icon-index")
    end
    
    return output
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
$('##{model_name}_list').prepend('#{escape_javascript(render('form'))}');
addAutofocusBehaviour();
addAutocompleteBehaviour();
addNestedFormsBehaviour();
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
