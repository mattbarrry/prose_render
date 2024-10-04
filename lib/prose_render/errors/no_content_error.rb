# frozen_string_literal: true

module ProseRender
  module Errors
    class NoContentError < BaseError
      MESSAGE = "You have passed in an invalid Prose Mirror document, missing the content attribute.\n\n" \
        "Please ensure you're passing in a valid Prose Mirror document, with a content attribute."
    end
  end
end
