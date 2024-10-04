# frozen_string_literal: true

require "action_controller"
require "view_component"

module ProseRender
  module Components
    class Base < ViewComponent::Base
      def parse_prose_content(contents)
        return "&nbsp;".html_safe if contents.nil?

        contents_for_render = contents.map do |content|
          nodes_to_html(content)
        end.join

        ActionView::OutputBuffer.new contents_for_render
      end

      def nodes_to_html(node)
        component = ProseRender.configuration.node_registry.fetch(node[:type])
        Rails.logger.info component
        ActionController::Base.render(component.new(node: node, **opts), layout: false)
      end

      def marks_to_html(text)
        return text[:text] unless text[:marks].present?

        marks = text[:marks]
        marks.reduce(text[:text]) do |memo, mark|
          component = ProseRender.configuration.mark_registry.fetch(mark[:type])
          ActionController::Base.render(component.new(mark: mark, **opts).with_content(memo), layout: false)
        end
      end

      def opts
        @opts ||= {}
      end
    end
  end
end
