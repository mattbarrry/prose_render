# frozen_string_literal: true

module ProseRender
  class ComponentRegistry
    def initialize
      @registry = {}
    end

    def register(type, component_class)
      @registry[type.to_s] = component_class
    end

    def fetch(type)
      @registry[type.to_s] || default_component
    end

    private

    def default_component
      ProseRender::Components::Marks::Text
    end
  end
end
