$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'support'))
require 'rubygems'
require 'do-schema'
require 'spec'
require 'spec/autorun'

Dir["#{File.dirname(__FILE__)}/{shared}/*.rb"].each do |file|
  require file
end

Spec::Runner.configure do |config|

end
