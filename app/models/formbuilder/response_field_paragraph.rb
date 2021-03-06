module Formbuilder
  class ResponseFieldParagraph < ResponseField

    include ActionView::Helpers::TagHelper
    include ActionView::Context

    after_initialize -> {
      @field_type = 'paragraph'
    }

    def render_input(value, opts = {})
      content_tag(:textarea, name: "response_fields[#{self.id}]", class: "rf-size-#{self[:field_options]['size']}",
                  data: self.length_validations) { value }
    end

    def render_entry(value, opts = {})
      ActionController::Base.helpers.simple_format(value)
    end

  end
end
