# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Text < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          marks_to_html(@node).html_safe
        end
      end
    end
  end
end
