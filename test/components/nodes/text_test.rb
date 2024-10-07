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
    end
  end
end
