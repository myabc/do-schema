require 'rubygems'
require 'rake'

begin

  require 'jeweler'

  Jeweler::Tasks.new do |gem|

    gem.name        = "do-schema"
    gem.summary     = %Q{TODO: one-line summary of your gem}
    gem.description = %Q{TODO: longer description of your gem}
    gem.email       = "d.bussink@gmail.com"
    gem.homepage    = "http://github.com/dbussink/do-schema"
    gem.authors     = ["Dirkjan Bussink"]

    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard",  ">= 0"

  end

  Jeweler::GemcutterTasks.new

  FileList['tasks/**/*.rake'].each { |task| import task }

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

