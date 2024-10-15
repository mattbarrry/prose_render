# frozen_string_literal: true

module ProseRender
  module Components
    module Marks
      class TextStyle < ProseRender::Components::Base
        require "active_support/inflector"

        def initialize(mark:, **opts)
          @mark = mark
          @opts = opts
        end

        def call
          content_tag :span, content, style: style_attrs
        end

        private

        def style_attrs
          return unless @mark[:attrs]

          @mark[:attrs].map do |key, value|
            "#{key.to_s.underscore.dasherize}: #{value}"
          end.join("; ") << ";"
        end
      end
    end
  end
end
