ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag
end

ActionView::Base.default_form_builder = ActionView::Helpers::LabeledFormBuilder