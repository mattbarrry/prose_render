# frozen_string_literal: true

module ProseRender
  module Components
    module Marks
      class Bold < ProseRender::Components::Base
        def initialize(mark:, **opts)
          @mark = mark
          @opts = opts
        end

        def call
          content_tag :strong, content
        end
      end
    end
  end
end
