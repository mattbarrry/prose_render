# frozen_string_literal: true

module ProseRender
  module Components
    module Marks
      class Link < ProseRender::Components::Base
        def initialize(mark:, **opts)
          @mark = mark
          @opts = opts
        end

        def call
          link_to @mark[:attrs][:href], title: @mark[:attrs][:title] do
            content
          end
        end
      end
    end
  end
end
