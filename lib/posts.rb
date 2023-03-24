class Posts
    def initialize(id, title, content, views, user_id)
        @id = id
        @title = title
        @content = content
        @views = views
        @user_id = user_id
    end

    attr_accessor :id, :title, :content, :views, :user_id
    # def all
    #     albums = []

    #     sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    #     result_set = DatabaseConnection.exec_params(sql, [])

    #     result_set.each do |record|

    #         album = Album.new
    #         album.id = record['id'].to_i
    #         album.title = record['title']
    #         album.release_year = record['release_year'].to_i
    #         album.artist_id = record['artist_id'].to_i
    #         albums << album
    #     end
    #     return albums
    # end

    # def find(id)
    #     sql = "SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;"
    #     sql_params = [id]

    #     result_set = DatabaseConnection.exec_params(sql, params)
    #     record = result_set[0]

    #         album = Album.new
    #         album.id = record['id'].to_i
    #         album.title = record['title']
    #         album.release_year = record['release_year'].to_i
    #         album.artist_id = record['artist_id'].to_i

    #     return albums
    # end

    # # Databases Ch 7 - create method added
    # def create(album)
    #     sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    #     sql_params = [album.title, album.release_year, album.artist_id]

    #     DatabaseConnection.exec_params(sql, sql_params)
    #     return nil
    # end

end