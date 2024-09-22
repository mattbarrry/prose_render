# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Code < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag :pre do
            content_tag :code do
              parse_prose_content(@node[:content])
            end
          end
        end
      end
    end
  end
end
