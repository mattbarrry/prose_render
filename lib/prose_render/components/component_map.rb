# frozen_string_literal: true

module ProseRender
  module Components
    module ComponentMap
      DEFAULT_NODE = Nodes::Paragraph
      NODE_MAPPINGS = {
        paragraph: Nodes::Paragraph,
        text: Nodes::Text
      }.freeze

      DEFAULT_MARK = Marks::Bold
      MARK_MAPPINGS = {
        code: Marks::Code,
        em: Marks::Italic,
        link: Marks::Link,
        strong: Marks::Bold
      }.freeze
    end
  end
end
