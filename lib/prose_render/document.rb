# frozen_string_literal: true

module ProseRender
  class Document
    class << self
      def render(doc)
        hash_doc = doc.is_a?(String) ? JSON.parse(doc, symbolize_names: true) : doc

        raise ProseRender::Errors::NoContentError unless hash_doc.key? :content

        nodes = hash_doc[:type] == "doc" ? hash_doc[:content] : [hash_doc]

        ProseRender::Components::Base.new.parse_prose_content(nodes)
      end
    end
  end
end
