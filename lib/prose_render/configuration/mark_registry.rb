# frozen_string_literal: true

module ProseRender
  module Configuration
    class MarkRegistry
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

      def load_defaults
        register("code", "ProseRender::Components::Marks::Code")
        register("italic", "ProseRender::Components::Marks::Italic")
        register("link", "ProseRender::Components::Marks::Link")
        register("bold", "ProseRender::Components::Marks::Bold")
      end

      def default_component
        ProseRender::Components::Marks::Bold
      end
    end
  end
end
