# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class BulletListTest < ViewComponent::TestCase
      def test_bullet_list
        node = json_node("nodes/bullet_list.json")
        render_inline(ProseRender::Components::Nodes::BulletList.new(node: node))

        assert_component_rendered

        assert_selector("ul > li > p")
      end
    end
  end
end
