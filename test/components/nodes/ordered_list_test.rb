# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class OrderedListTest < ViewComponent::TestCase
      def test_ordered_list
        node = json_node("nodes/ordered_list.json")
        render_inline(ProseRender::Components::Nodes::OrderedList.new(node: node))

        assert_component_rendered

        assert_selector "ol > li > p", count: 3
      end

      def test_ordered_list_offset
        node = json_node("nodes/ordered_list_offset.json")
        render_inline(ProseRender::Components::Nodes::OrderedList.new(node: node))

        assert_component_rendered

        assert_selector "ol[start='3']"
      end
    end
  end
end
