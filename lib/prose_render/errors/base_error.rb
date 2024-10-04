# frozen_string_literal: true

module ProseRender
  module Errors
    class BaseError < StandardError
      def initialize
        super(self.class::MESSAGE)
      end
    end
  end
end
