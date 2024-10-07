# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class ListItemTest < ViewComponent::TestCase
      def test_list_item
        node = json_node("nodes/list_item.json")
        render_inline(ProseRender::Components::Nodes::ListItem.new(node: node))

        assert_component_rendered

        assert_selector "li > p"
      end
    end
  end
end
