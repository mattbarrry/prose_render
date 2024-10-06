# frozen_string_literal: true

require "rails"
require "view_component"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

require_relative "prose_render/railtie"

module ProseRender
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration::Config.new
      yield(configuration) if block_given?
    end
  end
end
