# frozen_string_literal: true

module ProseRender
  class Configuration
    attr_accessor :node_registry, :mark_registry

    def initialize
      @node_registry = NodeRegistry.new
      @mark_registry = MarkRegistry.new
      load_defaults
    end

    # Delegate register method to the registry
    def register_node(type, component_class)
      node_registry.register(type, component_class)
    end

    def register_mark(type, component_class)
      mark_registry.register(type, component_class)
    end

    private

    def load_defaults
      load_default_nodes
      load_default_marks
    end

    def load_default_nodes
      register_node("blockquote", "ProseRender::Components::Nodes::Blockquote")
      register_node("code_block", "ProseRender::Components::Nodes::Code")
      register_node("hard_break", "ProseRender::Components::Nodes::HardBreak")
      register_node("heading", "ProseRender::Components::Nodes::Heading")
      register_node("horizontal_rule", "ProseRender::Components::Nodes::HorizontalRule")
      register_node("image", "ProseRender::Components::Nodes::Image")
      register_node("paragraph", "ProseRender::Components::Nodes::Paragraph")
      register_node("text", "ProseRender::Components::Nodes::Text")
    end

    def load_default_marks
      register_mark("code", "ProseRender::Components::Marks::Code")
      register_mark("em", "ProseRender::Components::Marks::Italic")
      register_mark("link", "ProseRender::Components::Marks::Link")
      register_mark("strong", "ProseRender::Components::Marks::Bold")
    end
  end
end
