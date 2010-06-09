require 'do_sqlite3'
puts "Using SQLite3"

@@db_file = "spec/support/fixtures/fixture_database.sqlite3"

unless File.exist?(@@db_file)
  puts "SQLite3 database not found at #{db_file}. Rebuilding it."
  require 'fileutils'
  FileUtils.mkdir_p(File.dirname(db_file))
  sqlite_command = %Q{sqlite3 "#{db_file}" "create table a (a integer); drop table a;"}
  puts "Executing '#{sqlite_command}'"
  raise "Seems that there is no sqlite3 executable available" unless system(sqlite_command)
end
