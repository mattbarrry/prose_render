# frozen_string_literal: true

module ProseRender
  class Error < StandardError; end
end

require "rails"
require "view_component"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup
