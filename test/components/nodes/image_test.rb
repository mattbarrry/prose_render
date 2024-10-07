# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class ImageTest < ViewComponent::TestCase
      def test_image_renders_src
        node = json_node("nodes/image.json")
        render_inline(ProseRender::Components::Nodes::Image.new(node: node))

        assert_component_rendered

        assert_selector("img[src='#{node[:attrs][:src]}']")
      end

      def test_image_renders_alt
        node = json_node("nodes/image.json")
        render_inline(ProseRender::Components::Nodes::Image.new(node: node))

        assert_component_rendered

        assert_selector("img[alt='#{node[:attrs][:alt]}']")
      end

      def test_image_renders_href
        node = json_node("nodes/image.json")
        render_inline(ProseRender::Components::Nodes::Image.new(node: node))

        assert_component_rendered

        assert_selector("img[href='#{node[:attrs][:href]}']")
      end
    end
  end
end
