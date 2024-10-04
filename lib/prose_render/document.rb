# frozen_string_literal: true

require "json"

module ProseRender
  class Document
    class << self
      def render(doc)
        hash_doc = doc.is_a?(String) ? JSON.parse(doc, symbolize_names: true) : doc

        raise ProseRender::Errors::NoContentError unless hash_doc.key? :content

        ProseRender::Components::Base.new.parse_prose_content(hash_doc[:content])
      end
    end
  end
end
