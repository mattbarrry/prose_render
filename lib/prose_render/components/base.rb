# frozen_string_literal: true

module ProseRender
  module Components
    class Base < ViewComponent::Base
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
        # TODO: Hook into custom node mappings
        component = ComponentMap::NODE_MAPPINGS[node[:type]] || ComponentMap::DEFAULT_NODE
        render component.new(node: node, **@opts)
      end

      def text_to_html(text)
        return text[:text] unless text[:marks].present?

        marks = text[:marks]
        marks.reduce(text[:text]) do |memo, mark|
          component = ComponentMap::MARK_MAPPINGS[mark[:type]] || ComponentMap::DEFAULT_MARK
          render component.new(mark: mark, **@opts).with_content(memo)
        end
      end
    end
  end
end
