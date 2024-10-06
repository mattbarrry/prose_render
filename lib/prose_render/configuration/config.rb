# frozen_string_literal: true

module ProseRender
  module Configuration
    class Config
      attr_accessor :node_registry, :mark_registry

      def initialize
        @node_registry = NodeRegistry.new
        @mark_registry = MarkRegistry.new
      end

      # Delegate register method to the registry
      def register_node(type, component_class)
        node_registry.register(type, component_class)
      end

      def register_mark(type, component_class)
        mark_registry.register(type, component_class)
      end
    end
  end
end
