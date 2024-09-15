# frozen_string_literal: true

module ProseRender
  module Components
    class ComponentMap
      NODE_MAPPINGS = {
        paragraph: Nodes::Paragraph
      }.freeze

      MARK_MAPPINGS = {
        bold: Marks::Bold
      }.freeze
    end
  end
end
