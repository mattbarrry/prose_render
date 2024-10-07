# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class HardBreakTest < ViewComponent::TestCase
      def test_code_block
        node = json_node("nodes/hard_break.json")
        render_inline(ProseRender::Components::Nodes::HardBreak.new(node: node))

        assert_component_rendered

        assert_selector("br")
      end
    end
  end
end
