# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class BlockquoteTest < ViewComponent::TestCase
      def test_render_blockquote
        node = json_node("nodes/blockquote.json")
        render_inline(ProseRender::Components::Nodes::Blockquote.new(node: node))

        assert_component_rendered

        assert_selector("blockquote > p")
      end
    end
  end
end
