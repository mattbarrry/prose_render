# frozen_string_literal: true

module ProseRender
  module Errors
    class InvalidJsonError < BaseError
      MESSAGE = "You have passed in an invalid JSON string. "
    end
  end
end
