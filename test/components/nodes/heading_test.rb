# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class HeadingTest < ViewComponent::TestCase
      def test_heading
        node_doc = json_node("nodes/heading.json")

        node_doc[:content].each do |node|
          render_inline(ProseRender::Components::Nodes::Heading.new(node: node))

          assert_component_rendered

          expected_tag = "h#{node[:attrs][:level]}"
          assert_selector(expected_tag)
        end
      end
    end
  end
end
