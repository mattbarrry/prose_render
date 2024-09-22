# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Heading < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          content_tag tag do
            parse_prose_content(@node[:content])
          end
        end

        private

        def tag
          "h#{level}".to_sym
        end

        def level
          @node[:attrs][:level]
        end
      end
    end
  end
end
