# Running 'bundle install' will install the latest do_sqlite3 adapter
#
# Use the ADAPTER or ADAPTERS env variables to control which adapters
# will be part of the bundle and thus available for running tests.
#
#   ADAPTER=mysql bundle install
#   ADAPTER=mysql,postgres bundle install
#
# Bundler will remember these settings in subsequent bundle install runs

source :rubygems

DO_VERSION  = '~> 0.10.3'
DO_ADAPTERS = %w[sqlite postgres mysql oracle sqlserver]

gem 'data_objects', DO_VERSION, :github => 'datamapper/do'

group :development do
  gem 'devtools', :github => 'datamapper/devtools'
  eval File.read('Gemfile.devtools')
end
