# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class ParagraphTest < ViewComponent::TestCase
      def test_render_paragraph
        node = json_node("nodes/paragraph.json")

        render_inline(ProseRender::Components::Nodes::Paragraph.new(node: node))

        assert_component_rendered

        assert_selector "p"
      end
    end
  end
end
