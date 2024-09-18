# frozen_string_literal: true

module ProseRender
  module Components
    module ComponentMap
      DEFAULT_NODE = Nodes::Paragraph
      NODE_MAPPINGS = {
        paragraph: Nodes::Paragraph
      }.freeze

      DEFAULT_MARK = Marks::Bold
      MARK_MAPPINGS = {
        strong: Marks::Bold
      }.freeze
    end
  end
end
