# frozen_string_literal: true

require_relative "lib/tottoruby_rps/version"

Gem::Specification.new do |spec|
  spec.name = "tottoruby_rps"
  spec.version = TottorubyRps::VERSION
  spec.authors = ["SAKAGUCHI Takashi"]
  spec.summary = "rock, paper, scissors."
  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
