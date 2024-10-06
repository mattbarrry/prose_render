# frozen_string_literal: true

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"

require "byebug"
require "json"
require "rails/test_help"
require "view_component/test_helpers"

class ActiveSupport::TestCase
  self.file_fixture_path = "test/fixtures"

  def json_node(filename)
    node_json = file_fixture(filename).read

    JSON.parse(node_json, symbolize_names: true)
  end
end
