# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class SubscriptTest < ViewComponent::TestCase
      def test_render_subscript
        mark = json_node("marks/subscript.json")
        render_inline(ProseRender::Components::Marks::Subscript.new(mark: mark)) { "This is subscript." }

        assert_component_rendered

        assert_selector "sub", text: "This is subscript."
      end
    end
  end
end
