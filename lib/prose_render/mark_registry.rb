# frozen_string_literal: true

module ProseRender
  class MarkRegistry
    def initialize
      @registry = {}
    end

    def register(type, component_class)
      @registry[type.to_s] = component_class
    end

    def fetch(type)
      @registry[type.to_s].constantize || default_component
    end

    private

    def default_component
      ProseRender::Components::Marks::Bold
    end
  end
end
