# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/users'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('social_network')

    # Perform a SQL query on the database and get the result set.
    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])

    # Print out each record from the result set .
    result.each do |users|
      p users
    end

    # # Perform a SQL query on the database and get the result set.
    # sql1 = 'SELECT * FROM artists;'
    # result1 = DatabaseConnection.exec_params(sql1, [])

    # # Print out each record from the result set .
    # result1.each do |record1|
    #   p record1
    # end


