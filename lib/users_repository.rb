require_relative "./posts"

class UsersRepository

    def all
        users = []
        sql = 'select * from users;'
        results = DatabaseConnection.exec_params(sql, [])
        return results.to_a
    end

    def find(id)
        sql = 'select * from users where id = $1;'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)
        return result.to_a[0].to_h
    end

    def create(username, email_address)
        sql = 'INSERT INTO users (username, email_address) VALUES ($1, $2);'
        sql_params = [username, email_address]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil

    end

    def delete(id)
        sql = 'delete from users where id = $1;'
        sql_params = [id]
        DatabaseConnection.exec_params(sql, sql_params)
        return nil
    end

    def update(user)
        sql = 'UPDATE users SET email_address  = $1 where id = $2;'
        # sql_params = [user['username'], user['email_address'], user['id']]
        sql_params = [user['email_address'], user['id']]
        DatabaseConnection.exec_params(sql, sql_params)
        return nil
    end
    
end
