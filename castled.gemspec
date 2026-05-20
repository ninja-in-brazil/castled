# frozen_string_literal: true

require_relative "lib/castled/version"

Gem::Specification.new do |spec|
  spec.name          = "castled"
  spec.version       = Castled::VERSION
  spec.authors       = ["Castled"]
  spec.email         = ["castled@example.com"]

  spec.summary       = "Simple backups via simple-backup CLI"
  spec.description   = "Initialize, backup, and restore files with a YAML config"
  spec.homepage      = "https://github.com/example/castled"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.start_with?("test/", ".git")
    end
  rescue StandardError
    %w[
      castled.gemspec
      Gemfile
      README.md
      exe/simple-backup
      lib/castled.rb
      lib/castled/version.rb
      lib/castled/cli.rb
      lib/castled/config.rb
      lib/castled/backup.rb
      test/test_helper.rb
      test/test_config.rb
      test/test_backup.rb
      test/test_cli.rb
    ]
  end

  spec.bindir        = "exe"
  spec.executables   = ["simple-backup"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", ">= 13.0"
end
