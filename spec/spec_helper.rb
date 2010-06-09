$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'support'))
require 'rubygems'
require 'do-schema'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|

end
