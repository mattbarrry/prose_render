# frozen_string_literal: true

require_relative "lib/prose_render/version"

Gem::Specification.new do |spec|
  spec.name = "prose_render"
  spec.version = ProseRender::VERSION
  spec.authors = ["Matt Barry"]
  spec.email = ["mbarry@gmail.com"]

  spec.summary = "Render Prose Mirror based JSON documents, such as TipTap, to HTML."
  spec.description = "A simple, but customizable way to render Prose Mirror based JSON documents."
  spec.homepage = "https://github.com/mattbarrry"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mattbarrry/prose_render"
  spec.metadata["changelog_uri"] = "https://github.com/mattbarrry/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "view_component", ">= 3.0"
  spec.add_dependency "zeitwerk", "~> 2.5"

  spec.add_development_dependency "capybara"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
