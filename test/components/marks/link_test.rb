# frozen_string_literal: true

require "test/test_helper"

module Components
  module Marks
    class BoldTest < ViewComponent::TestCase
      def test_render_link
        mark = json_node("marks/link.json")
        render_inline(ProseRender::Components::Marks::Link.new(mark: mark)) { "This is a link." }

        assert_component_rendered

        assert_selector "a[href='#{mark[:attrs][:href]}']", text: "This is a link."
        assert_selector "a[title='#{mark[:attrs][:title]}']", text: "This is a link."
      end
    end
  end
end
