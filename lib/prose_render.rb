# frozen_string_literal: true

require "rails"
require "view_component"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module ProseRender
  class Error < StandardError; end

  class Engine < ::Rails::Engine
    isolate_namespace ProseRender
  end

  def self.component_registry
    @component_registry ||= ComponentRegistry.new
  end

  def self.configure
    yield(component_registry) if block_given?
  end

  def self.setup_default_components
    component_registry.register("paragraph", ProseRender::Components::Nodes::Paragraph)
    component_registry.register("text", ProseRender::Components::Nodes::Text)
  end
end


ProseRender.setup_default_components
