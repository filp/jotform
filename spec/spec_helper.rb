$LOAD_PATH << File.expand_path("../lib", __FILE__)

require "webmock/rspec"
require "vcr"
require "jotform"

if ENV["JOTFORM_API_KEY"].nil?
  ENV["JOTFORM_API_KEY"] = "o_o"
  $stderr.puts "Warning: JOTFORM_API_KEY not set, tests not already recorded with VCR may fail."
end

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = File.join(File.dirname(__FILE__), "fixtures/vcr")
  c.filter_sensitive_data("<apiKey>") { ENV["JOTFORM_API_KEY"] }
end