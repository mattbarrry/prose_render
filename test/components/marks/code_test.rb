# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class CodeTest < ViewComponent::TestCase
      def test_render_inline_code
        mark = json_node("marks/code.json")
        render_inline(ProseRender::Components::Marks::Code.new(mark: mark)) { "This is code." }

        assert_component_rendered

        assert_selector "code", text: "This is code."
      end
    end
  end
end
