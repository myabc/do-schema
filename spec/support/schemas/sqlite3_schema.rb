sql = <<-SQL
  DROP TABLE IF EXISTS users;
  CREATE TABLE users (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
  );

  DROP TABLE IF EXISTS photos;
  CREATE TABLE photos (
    id INTEGER NOT NULL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    camera_id INTEGER NOT NULL
  );
  DROP TABLE IF EXISTS developers;
  CREATE TABLE developers (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    salary INTEGER NOT NULL,
    department VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL
  );
SQL

conn = DataObjects::Connection.new("sqlite3://#{File.expand_path(@@db_file)}")
sql.split(/;/).each do |sql_statement|
  conn.create_command(sql_statement).execute_non_query
end
