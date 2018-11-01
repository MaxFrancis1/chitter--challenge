require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'Chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE users;")

end
