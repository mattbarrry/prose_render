# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class ItalicTest < ViewComponent::TestCase
      def test_render_italic
        mark = json_node("marks/italic.json")
        render_inline(ProseRender::Components::Marks::Italic.new(mark: mark)) { "This is italic." }

        assert_component_rendered

        assert_selector "em", text: "This is italic."
      end
    end
  end
end
