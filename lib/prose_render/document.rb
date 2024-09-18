# frozen_string_literal: true

require "json"
require_relative "components/base"

module ProseRender
  class Document
    class << self
      def render(doc)
        hash_doc = doc.is_a?(String) ? JSON.parse(doc, symbolize_names: true) : doc

        raise ProseRender::InvalidDocumentError unless hash_doc[:type] == "doc"

        ProseRender::Components::Base.new.parse_prose_content(hash_doc[:content])
      end
    end
  end
end
