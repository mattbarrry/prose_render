# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      module Tables
        class Cell < ProseRender::Components::Base
          def initialize(node:, **opts)
            @node = node
            @opts = opts
          end

          def call
            content_tag tag, cell_attrs do
              parse_prose_content(@node[:content])
            end
          end

          private

          def tag
            @node[:type] == "table_header" || @node[:type] == "tableHeader" ? :th : :td
          end

          def cell_attrs
            attrs = {
              colspan: @node[:attrs][:colspan] || 1,
              rowspan: @node[:attrs][:rowspan] || 1
            }

            attrs.merge!(column_width) if @node[:attrs][:colwidth]

            attrs
          end

          def column_width
            {
              style: "width: #{@node[:attrs][:colwidth].sum}px;"
            }
          end
        end
      end
    end
  end
end
