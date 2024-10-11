# frozen_string_literal: true

require "test/test_helper"

module Components
  module Nodes
    class TableTest < ViewComponent::TestCase
      def test_render_tables
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_component_rendered

        assert_selector "table"
      end

      def test_table_renders_rows
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_selector "tr", count: 3
      end

      def test_renders_table_headers
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_selector "th", count: 3
      end

      def test_renders_cells
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_selector "td", count: 5
        assert_selector "td[colspan=2]"
      end

      def test_cells_render_col_spans
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_selector "td[colspan=2]"
      end

      def test_cells_render_inline_style
        node = json_node("nodes/table.json")

        render_inline(ProseRender::Components::Nodes::Table.new(node: node))

        assert_selector "td[style='width: 100px;']"
      end
    end
  end
end
