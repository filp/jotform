$LOAD_PATH << File.expand_path("../lib", __FILE__)

require "webmock/rspec"
require "vcr"
require "jotform"

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), "fixtures/vcr")
  c.hook_into :webmock
end

if ENV["JOTFORM_API_KEY"].nil?
  raise "Missing JotForm API Key, please set ENV[JOTFORM_API_KEY]"
end