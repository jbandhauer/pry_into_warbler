# Find the JRuby version from .ruby-version to keep compatibility
# with tools that exclusively use .ruby-version.
MY_JRUBY_VERSION = File.read(File.join(File.dirname(__FILE__), '.ruby-version')).split('-').last.chomp

ruby '2.3.1', engine: 'jruby', engine_version: MY_JRUBY_VERSION

source "https://rubygems.org"

platforms :jruby do
  gem 'jruby-jars',       MY_JRUBY_VERSION
  gem 'jruby-openssl',    '0.9.19'

  gem 'pry',              '0.10.1'
  gem 'warbler',          git: 'git@github.com:looker/warbler.git', :branch => 'looker-custom-2.0.4'
end
