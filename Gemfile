# Running 'bundle install' will install the latest do_sqlite3 adapter
#
# Use the ADAPTER or ADAPTERS env variables to control which adapters
# will be part of the bundle and thus available for running tests.
#
#   ADAPTER=mysql bundle install
#   ADAPTER=mysql,postgres bundle install
#
# Bundler will remember these settings in subsequent bundle install runs

source 'http://rubygems.org'

REPOSITORY  = 'git://github.com/datamapper'
DO_VERSION  = '~> 0.10.3'
DO_ADAPTERS = %w[sqlite postgres mysql oracle sqlserver]

gem 'data_objects',      DO_VERSION, :git => "#{REPOSITORY}/do.git"

group :development do

  gem 'rake',            '~> 0.8.7'
  gem 'rspec',           '~> 1.3.0', :git => 'git://github.com/snusnu/rspec', :branch => 'heckle_fix_plus_gemfile'
  gem 'jeweler',         '~> 1.4'

end

group :quality do

  gem 'ParseTree',       '~> 3.0.5'
  gem 'sexp_processor',  '~> 3.0.4'
  gem 'metric_fu',       '~> 1.3', :git => 'git://github.com/snusnu/metric_fu', :branch => '1.3.0_fileutils_fix'
  gem 'flay',            '~> 1.4.0'
  gem 'flog',            '~> 2.2.0'
  gem 'heckle',          '~> 1.4.3'
  gem 'mspec',           '~> 1.5.17'
  gem 'json',            '~> 1.4.3'
  gem 'rcov',            '~> 0.9.8'
  gem 'reek',            '~> 1.2.8'
  gem 'roodi',           '~> 2.1'
  gem "churn",           '~> 0.0.7'
  gem 'ruby2ruby',       '=  1.2.2'
  gem 'yard',            '~> 0.5.8'
  gem 'yardstick',       '~> 0.1'

end

group :datamapper do

  adapters = ENV['ADAPTER'] || ENV['ADAPTERS']
  adapters = adapters.to_s.gsub(',',' ').split(' ')
  adapters << 'sqlite' if adapters.empty?

  adapters.each do |adapter|
    if DO_ADAPTERS.any? { |do_adapter| do_adapter =~ /#{adapter}/  }
      adapter = 'sqlite3' if adapter == 'sqlite'
      gem "do_#{adapter}", DO_VERSION, :git => "#{REPOSITORY}/do.git"
    end
  end

end
