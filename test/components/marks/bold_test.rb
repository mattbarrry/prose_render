# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class BoldTest < ViewComponent::TestCase
      def test_render_bold
        mark = json_node("marks/bold.json")
        render_inline(ProseRender::Components::Marks::Bold.new(mark: mark)) { "This is bold." }

        assert_component_rendered

        assert_selector "strong", text: "This is bold."
      end
    end
  end
end
