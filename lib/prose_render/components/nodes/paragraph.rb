# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Paragraph < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag :p do
            parse_prose_content(@node[:content])
          end
        end
      end
    end
  end
end
