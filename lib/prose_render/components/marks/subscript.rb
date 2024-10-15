# frozen_string_literal: true

module ProseRender
  module Components
    module Marks
      class Subscript < ProseRender::Components::Base
        def initialize(mark:, **opts)
          @mark = mark
          @opts = opts
        end

        def call
          content_tag :sub, content
        end
      end
    end
  end
end
