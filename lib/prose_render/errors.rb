# frozen_string_literal: true

module ProseRender
  class BaseError < StandardError
    def initialize
      super(self.class::MESSAGE)
    end
  end

  class InvalidDocumentError < BaseError
    MESSAGE = "An invalid Prose Mirror JSON document was passed to the document renderer.\n\n" \
      "Please ensure you're passing a top level document, with a type of \"doc\"."
  end
end
