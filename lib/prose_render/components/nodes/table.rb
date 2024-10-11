# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Table < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag :table do
            content_tag :tbody do
              parse_prose_content(@node[:content])
            end
          end
        end
      end
    end
  end
end
