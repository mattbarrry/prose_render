# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Paragraph < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
          @nested_content = parse_prose_content(@node[:content])
        end

        def call
          content_tag :p do
            @nested_content
          end
        end
      end
    end
  end
end
