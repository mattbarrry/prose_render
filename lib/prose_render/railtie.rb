# frozen_string_literal: true

module ProseRender
  class Railtie < Rails::Railtie
    config.after_initialize do
      ProseRender.configure if ProseRender.configuration.nil?
    end
  end
end
