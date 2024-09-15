# frozen_string_literal: true

module ProseRender
  module Components
    class Base < ViewComponent::Base

      class << self
        def parse_prose_content(contents)
          return "&nbsp;".html_safe if contents.nil?

          contents.map do |content|
            content_to_html(content)
          end.join.html_safe
        end

        def content_to_html(content)
          content[:type] == "text" ? nodes_to_html(content) : text_to_html(content)
        end

        def nodes_to_html(node)
          # find node component from custom, then default
          # render
        end

        def text_to_html(text)
          # return text[:text] unless text[:marks].present?
          #
          # process marks
        end
      end
    end
  end
end
