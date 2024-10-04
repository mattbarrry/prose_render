# frozen_string_literal: true

module ProseRender
  class Error < StandardError; end

  class BaseError < StandardError
    def initialize
      super(self.class::MESSAGE)
    end
  end

  class NoContentError < BaseError
    MESSAGE = "You have passed in an invalid Prose Mirror document, missing the content attribute.\n\n" \
      "Please ensure you're passing in a valid Prose Mirror document, with a content attribute."
  end

  class InvalidJSONError < BaseError
    MESSAGE = "You have passed in an invalid JSON string. "
  end
end
