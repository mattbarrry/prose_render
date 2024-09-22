# frozen_string_literal: true

module ProseRender
  module Components
    module ComponentMap
      DEFAULT_NODE = Nodes::Paragraph
      NODE_MAPPINGS = {
        blockquote: Nodes::Blockquote,
        code_block: Nodes::Code,
        hard_break: Nodes::HardBreak,
        heading: Nodes::Heading,
        horizontal_rule: Nodes::HorizontalRule,
        image: Nodes::Image,
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
