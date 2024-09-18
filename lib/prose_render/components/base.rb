# frozen_string_literal: true

require "view_component"

module ProseRender
  module Components
    class Base < ViewComponent::Base
      def parse_prose_content(contents)
        puts contents
        return "&nbsp;" if contents.nil?

        contents.map do |content|
          content_to_html(content)
        end.join.html_safe
      end

      def content_to_html(content)
        content[:type] == "text" ? text_to_html(content) : nodes_to_html(content)
      end

      def nodes_to_html(node)
        # TODO: Hook into custom node mappings
        component = ComponentMap::NODE_MAPPINGS[node[:type].to_sym] || ComponentMap::DEFAULT_NODE
        ApplicationController.render component.new(node: node, **opts)
      end

      def text_to_html(text)
        return text[:text] unless text[:marks].present?

        marks = text[:marks]
        marks.reduce(text[:text]) do |memo, mark|
          component = ComponentMap::MARK_MAPPINGS[mark[:type].to_sym] || ComponentMap::DEFAULT_MARK
          ApplicationController.render component.new(mark: mark, **opts).with_content(memo)
        end
      end

      def opts
        @opts ||= {}
      end
    end
  end
end
