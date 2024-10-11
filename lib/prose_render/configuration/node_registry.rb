# frozen_string_literal: true

module ProseRender
  module Configuration
    class NodeRegistry
      def initialize
        @registry = {}
        load_prose_registry
        load_tiptap_registry
      end

      def register(type, component_class)
        @registry[type.to_s] = component_class
      end

      def fetch(type)
        @registry[type.to_s]&.constantize || default_component
      end

      private

      def default_component
        ProseRender::Components::Nodes::Text
      end

      # rubocop:disable Metrics/MethodLength
      def load_prose_registry
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
        register("table", "ProseRender::Components::Nodes::Table")
        register("table_row", "ProseRender::Components::Nodes::Tables::Row")
        register("table_header", "ProseRender::Components::Nodes::Tables::Cell")
        register("table_cell", "ProseRender::Components::Nodes::Tables::Cell")
        register("text", "ProseRender::Components::Nodes::Text")
      end
      # rubocop:enable Metrics/MethodLength

      # TipTap has different types for the same block in some instances. For example,
      # ProseMirror uses code_block, whereas TipTap uses codeBlock. There are also extended
      # node types beyond Prose defaults.
      def load_tiptap_registry
        register("codeBlock", "ProseRender::Components::Nodes::Code")
        register("hardBreak", "ProseRender::Components::Nodes::HardBreak")
        register("horizontalRule", "ProseRender::Components::Nodes::HorizontalRule")
        register("tableRow", "ProseRender::Components::Nodes::Tables::Row")
        register("tableHeader", "ProseRender::Components::Nodes::Tables::Cell")
        register("tableCell", "ProseRender::Components::Nodes::Tables::Cell")
      end
    end
  end
end
