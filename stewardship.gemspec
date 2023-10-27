require_relative "lib/stewardship/version"

Gem::Specification.new do |spec|
  spec.name = "stewardship"
  spec.version = Stewardship::VERSION
  spec.authors = ["cdimartino"]
  spec.email = ["chris.dimartino@gmail.com"]

  spec.summary = "Notify the responsible party when a gem receives updates."
  spec.description = "Notify a Slack channel, email address, etc when a gem receives a patch or release. Include details of the change."
  spec.homepage = "https://github.com/cdimartino/stewardship"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7"

  #spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/cdimartino/stewardship/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "bundler"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
