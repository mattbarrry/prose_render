# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class SuperscriptTest < ViewComponent::TestCase
      def test_render_superscript
        mark = json_node("marks/superscript.json")
        render_inline(ProseRender::Components::Marks::Superscript.new(mark: mark)) { "This is superscript." }

        assert_component_rendered

        assert_selector "sup", text: "This is superscript."
      end
    end
  end
end
