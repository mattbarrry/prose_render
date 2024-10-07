# frozen_string_literal: true

module ProseRender
  module Configuration
    class NodeRegistry
      def initialize
        @registry = {}
        load_defaults
      end

      def register(type, component_class)
        @registry[type.to_s] = component_class
      end

      def fetch(type)
        @registry[type.to_s]&.constantize || default_component
      end

      private

      # rubocop:disable Metrics/MethodLength
      def load_defaults
        register("blockquote", "ProseRender::Components::Nodes::Blockquote")
        register("bulletList", "ProseRender::Components::Nodes::BulletList")
        register("code_block", "ProseRender::Components::Nodes::Code")
        register("hard_break", "ProseRender::Components::Nodes::HardBreak")
        register("heading", "ProseRender::Components::Nodes::Heading")
        register("horizontal_rule", "ProseRender::Components::Nodes::HorizontalRule")
        register("image", "ProseRender::Components::Nodes::Image")
        register("listItem", "ProseRender::Components::Nodes::ListItem")
        register("orderedList", "ProseRender::Components::Nodes::OrderedList")
        register("paragraph", "ProseRender::Components::Nodes::Paragraph")
        register("text", "ProseRender::Components::Nodes::Text")
      end
      # rubocop:enable Metrics/MethodLength

      def default_component
        ProseRender::Components::Nodes::Text
      end
    end
  end
end
