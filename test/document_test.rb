# frozen_string_literal: true

require "test/test_helper"

class DocumentTest < ViewComponent::TestCase
  def test_can_render_valid_prose_document_string
    doc = json_node("sample_doc.json")

    result = ProseRender::Document.render(doc)

    assert_instance_of ActionView::OutputBuffer, result
  end

  def test_can_render_valid_prose_document_hash
    doc = file_fixture("sample_doc.json").read

    result = ProseRender::Document.render(doc)

    assert_instance_of ActionView::OutputBuffer, result
  end

  def test_render_no_content_error
    assert_raises(ProseRender::Errors::NoContentError) do
      ProseRender::Document.render({ type: "doc" })
    end

    assert_raises(ProseRender::Errors::NoContentError) do
      ProseRender::Document.render("{}")
    end
  end
end
