# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class TextStyleTest < ViewComponent::TestCase
      def test_render_with_styles
        mark = json_node("marks/text_style.json")
        render_inline(ProseRender::Components::Marks::TextStyle.new(mark: mark)) { "This has style." }

        assert_component_rendered


        assert_selector "span[style='background-color: #000000; font-size: 14px; font-weight: bold;']",
                        text: "This has style."
      end

      def test_render_with_no_style
        mark = {}
        render_inline(ProseRender::Components::Marks::TextStyle.new(mark: mark)) { "This has no style." }

        assert_component_rendered

        assert_selector "span", text: "This has no style."
        assert_nil page.find("span")[:style]
      end
    end
  end
end
