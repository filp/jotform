$LOAD_PATH << File.expand_path("../lib", __FILE__)

require "jotform"

if ENV["JOTFORM_API_KEY"].nil?
  raise "Missing JotForm API Key, please set ENV[JOTFORM_API_KEY]"
end