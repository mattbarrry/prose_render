# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class StrikeTest < ViewComponent::TestCase
      def test_render_strike
        mark = json_node("marks/strike.json")
        render_inline(ProseRender::Components::Marks::Strike.new(mark: mark)) { "This is strikethrough." }

        assert_component_rendered

        assert_selector "s", text: "This is strikethrough."
      end
    end
  end
end
