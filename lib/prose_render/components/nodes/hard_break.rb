# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class HardBreak < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag :br
        end
      end
    end
  end
end
