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

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end
  end
end
