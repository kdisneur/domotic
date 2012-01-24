module ActionView
  module Helpers
    class LabeledFormBuilder < ActionView::Helpers::FormBuilder
      helpers = field_helpers +
                %w{date_select datetime_select time_select} +
                %w{collection_select select country_select time_zone_select} -
                %w{hidden_field label fields_for}

      helpers.each do |name|
        define_method(name) do |field, *args|
          options          = args.last.is_a?(Hash) ? args.last : {}
          label            = label(field, options[:label], :class => options[:label_class])
          has_error        = ! @object.errors[field].empty?

          if has_error
            error_message    = @object.errors[field].first
            error_css        = "error"
          end

          @template.content_tag(:div, :class => "clearfix #{error_css}") do
            @template.concat(
              label +
              @template.content_tag(:div, :class => "input") do
                @template.concat(
                  super(field, *args) +
                  (@template.content_tag(:span, error_message, :class => "help-inline") if has_error)
                )
              end
            )
          end
        end
      end
    end
  end
end