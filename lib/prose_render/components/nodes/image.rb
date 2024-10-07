# frozen_string_literal: true

module ProseRender
  module Components
    module Nodes
      class Image < ProseRender::Components::Base
        def initialize(node:, **opts)
          @node = node
          @opts = opts
        end

        def call
          image_tag src, alt: alt, href: href
        end

        private

        def src
          @node[:attrs][:src]
        end

        def alt
          @node[:attrs][:alt] || ""
        end

        def href
          @node[:attrs][:href] || ""
        end
      end
    end
  end
end
