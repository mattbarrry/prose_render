# frozen_string_literal: true

module ProseRender
  class Document
    class << self
      def render(doc)
        hash_doc = doc.is_a? String ? JSON.parse(doc, symbolize_names: true) : doc

        raise ProseRender::InvalidDocumentError unless hash_doc[:type] == "doc"

        content_from_blocks hash_doc[:content]
      end
    end
  end
end


# {
#   "type": "doc",
#   "content": [
#     {
#       "type": "paragraph",
#       "content": [
#         {
#           "type": "text",
#           "text": "This is an example of a ProseMirror document."
#         }
#       ]
#     },
#     {
#       "type": "paragraph",
#       "content": [
#         {
#           "type": "text",
#           "text": "It supports multiple nodes and marks."
#         },
#         {
#           "type": "text",
#           "marks": [
#             {
#               "type": "strong"
#             }
#           ],
#           "text": " Bold text example."
#         },
#         {
#           "type": "text",
#           "marks": [
#             {
#               "type": "em"
#             }
#           ],
#           "text": " Italic text example."
#         }
#       ]
#     },
#     {
#       "type": "bullet_list",
#       "content": [
#         {
#           "type": "list_item",
#           "content": [
#             {
#               "type": "paragraph",
#               "content": [
#                 {
#                   "type": "text",
#                   "text": "First bullet point"
#                 }
#               ]
#             }
#           ]
#         },
#         {
#           "type": "list_item",
#           "content": [
#             {
#               "type": "paragraph",
#               "content": [
#                 {
#                   "type": "text",
#                   "text": "Second bullet point"
#                 }
#               ]
#             }
#           ]
#         }
#       ]
#     }
#   ]
# }