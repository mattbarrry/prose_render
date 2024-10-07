# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class HorizontalRuleTest < ViewComponent::TestCase
      def test_horizontal_rule
        node = json_node("nodes/horizontal_rule.json")
        render_inline(ProseRender::Components::Nodes::HorizontalRule.new(node: node))

        assert_component_rendered

        assert_selector("hr")
      end
    end
  end
end
