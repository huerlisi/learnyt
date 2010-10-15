module ApplicationHelper

  def index_contextual_for(model)
    model_name = model.to_s.underscore
    
    render 'layouts/index_contextual_for', :model => model, :model_name => model_name
  end

  def show_new_form(model)
    model_name = model.to_s.underscore
    
    output = <<EOF
$('##{model_name}_list').before('#{escape_javascript(render('form'))}')
addAutofocusBehaviour()
EOF
  
    return output.html_safe
  end
end
