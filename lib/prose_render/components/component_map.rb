# frozen_string_literal: true

module ProseRender
  module Components
    class ComponentMap
      DEFAULT_NODE = Nodes::Paragraph
      NODE_MAPPINGS = {
        paragraph: Nodes::Paragraph
      }.freeze

      DEFAULT_MARK = Marks::Bold
      MARK_MAPPINGS = {
        bold: Marks::Bold
      }.freeze
    end
  end
end
