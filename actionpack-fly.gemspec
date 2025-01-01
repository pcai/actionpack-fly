# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "action_pack/fly/version"

Gem::Specification.new do |spec|
  spec.name = "actionpack-fly"
  spec.version = ActionPack::Fly::VERSION
  spec.authors = ["Peter Cai"]
  spec.email = ["hello@petercai.com"]
  spec.summary =
    "Allow Rails request.remote_ip to defer to Fly's connecting IP address."
  spec.description =
    "Simple gem that extends Rails `request.remote_ip` to default to Fly's `Fly-Client-IP` header."
  spec.required_ruby_version = ">= 2.7.0"
  spec.homepage = "https://github.com/pcai/actionpack-fly"
  spec.license = "MIT"
  spec.files =
    `git ls-files -z`.split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = "exe"
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "actionpack", ">= 6.0", "< 9.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.metadata["rubygems_mfa_required"] = "true"
end
