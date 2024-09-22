# frozen_string_literal: true

module Components
  module Nodes
    class ParagraphTest < ViewComponent::TestCase
      def test_render_paragraph
        render_inline(ProseRender::Components::Nodes::Paragraph.new(node: { test: "value" }))

        assert_component_rendered

        assert_selector("p")
      end
    end
  end
end
