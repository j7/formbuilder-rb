module Formbuilder
  class ResponseFieldEmail < ResponseField

    include ActionView::Helpers::TagHelper

    after_initialize -> {
      @field_type = 'email'
    }

    def render_input(value, opts = {})
      tag(:input, type: 'text', name: "response_fields[#{self.id}]", class: "rf-size-#{self[:field_options]['size']}",
          data: self.length_validations, value: value)
    end

    def render_entry(value, opts = {})
      "<a href='mailto:#{value}'>#{value}</a>"
    end

    def validate_response(value)
      unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
        "isn't a valid email address."
      end
    end

  end
end
