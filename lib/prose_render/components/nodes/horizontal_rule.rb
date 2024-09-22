# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class HorizontalRule < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag :hr
        end
      end
    end
  end
end
