# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class CodeBlockTest < ViewComponent::TestCase
      def test_code_block
        node = json_node("nodes/code_block.json")
        render_inline(ProseRender::Components::Nodes::Code.new(node: node))

        assert_component_rendered

        assert_selector("pre > code")
      end
    end
  end
end
