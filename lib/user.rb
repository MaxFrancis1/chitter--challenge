require 'pg'

class User

  def self.sign_up(su_user_name:, su_password:, su_email:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    query = "INSERT INTO users (user_name, password, email) VALUES('#{su_user_name}', '#{su_password}', '#{su_email}') RETURNING user_name, password, email;"
    connection.exec(query)
  end

  def self.sign_in(li_user_name:, li_password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    query = "SELECT user_name FROM users WHERE user_name = '#{li_user_name}' AND password = '#{li_password}';"
    result = connection.exec(query)
    if result.map { |users| users['user_name']} == [li_user_name]
      return true
    else
      return false
    end
  end

  def self.username_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec('SELECT user_name FROM users')
    result.map { |users| users['user_name'] }
  end

  def self.password_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec('SELECT password FROM users')
    result.map { |users| users['password'] }
  end

  def self.email_list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec('SELECT email FROM users')
    result.map { |users| users['email'] }
  end

end
