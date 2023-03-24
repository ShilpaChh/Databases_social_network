class PostsRepository

    def all
        posts = []
        sql = 'SELECT * from posts;'
        results = DatabaseConnection.exec_params(sql, [])
        return results.to_a
    end

    def find(id)
        sql = 'SELECT * from posts where id = $1;'
        sql_params = [id]
        result = DatabaseConnection.exec_params(sql, sql_params)
        return result.to_a[0].to_h
    end

    def create(title, content, user_id, views)
        sql = 'INSERT INTO posts (title, content, user_id, views) VALUES ($1, $2, $3, $4);'
        sql_params = [title, content, user_id, views]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil
    end

    def delete(id)
        sql = 'DELETE from posts where id = $1;'
        sql_params = [id]
        DatabaseConnection.exec_params(sql, sql_params)
        return nil
    end

    def update(post)
        sql = 'UPDATE posts SET title  = $1 where id = $2;'
        # sql_params = [user['username'], user['email_address'], user['id']]
        sql_params = [post['title'], post['id']]
        DatabaseConnection.exec_params(sql, sql_params)
        return nil
    end

end