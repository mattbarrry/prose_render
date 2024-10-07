# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class ParagraphTest < ViewComponent::TestCase
      def test_render_text
        node = json_node("nodes/text.json")

        render_inline(ProseRender::Components::Nodes::Text.new(node: node))

        assert_component_rendered

        assert_text node[:text]
      end

      def text_with_single_mark
        node = json_node("nodes/text_with_single_mark.json")

        render_inline(ProseRender::Components::Nodes::Text.new(node: node))

        assert_component_rendered

        assert_selector "strong", text: node[:text]
      end

      def text_with_multiple_marks
        node = json_node("nodes/text_with_multiple_marks.json")

        render_inline(ProseRender::Components::Nodes::Text.new(node: node))

        assert_component_rendered

        assert_selector "strong > em", text: node[:text]
      end
    end
  end
end
