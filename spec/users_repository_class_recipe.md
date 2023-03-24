# MODEL AND REPOSITORY CLASSES DESIGN RECIPE

# 1 Design and Create the Table


# 2. Create Test SQL seeds


# 3. 


--- ruby

class Users
end

class UsersRepository
end

----



# 4 . Implement the Model Class

class Users
    attr_accessor  :id, :username, :email_address
end

# 5. Define the Repository Class Interface

# => Table Name: artists

# => Repository class
# (in lib/artist_repository.rb)

class UserRepository

    def all
        # Executes the SqL query:
        # SELECT id, username, email_address FROM users;
    end
    # select a single record
    # Given the id in argument (a number)

    def find(id)
        # Exceutes the SQL query:
        # SELECT id, username, email_address FROM users WHERE id = $1;

        # Returns a single user
    end

    <!-- Insert a new user record -->
    def create(user)
      <!-- Executes the SQL query
      INSERT INTO users (username, email_address) VALUES ($1, $2);
      
      Doesn't need to return anything (only creates the record) -->
    end

    <!-- Deletes an artist record
    given its id -->
    def delete(id)
      <!-- Executes the SQL:
      DELETE FROM users WHERE id = $1;
      
      Returns nothing (only deletes the record) -->
    end

    <!-- Updates an artist record
    Takes an user object (with the updated fields) -->
    def update(user)
      <!-- Executes the SQL:
      UPDATE users SET username = $1, email_address = $2 WHERE id = $3;
      
      Returns nothing (only updates the record) -->
    end

end

# DATABASES: CH 7 - Test-driving write operations
<!-- Work in the project directory music_library you've worked on before.

Test-drive the method .create on the class AlbumRepository from the previous project music_library. 

repository = AlbumRepository.new

album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 1

repository.create(album)

all_albums = repository.all

# The all_albums array should contain the new Album object
-->

# 6. Write Test Examples

# eg 1
Get all the users:

user_repo = UserRepository.new

users = repo.all # Should return all
users.length # => 2 as we are inserting 2 records in seeds_users_posts.sql
users[0].id # => 1
users[0].username # => 'Bob'
users[0].email_address # => 'Bob@googlemail.com'
        
users[1].id # => 2
users[1].username # => 'Steve'
users[1].email_address 3 => 'Steve@yahoo.com'

# eg 2
Get a single user

user_repo = UserRepository.new

user = repo.find(1)

user.name # => 'Bob' ###### as per the INSERT statement in seeds_users_posts.sql
user.email_address # => 'Bob@googlemail.com'


# create method
<!- Create a new user -->
user_repo = UserRepository.new

user = User.new
user.username # => 'James'
user.emai_address # => 'james.h@dwp.gov.uk'

repo.create(user) # => nil


#  delete method
<!- Create a new artist -->
user_repo = UserRepository.new

id_to_delete = 1

repo.delete(id_to_delete)

all_users = repo.all
all_users.length # => 1 
all_users.first.id # => '2' # as we deleted id 1, so, only id 2 shd be remaining

# eg 6 for - DATABASES: CH 7 - Test-driving write operations - update method - name and genre
<!- Create a new artist -->
user_repo = UserRepository.new

artist = repo.find(1) #  find artist 1

artist.name = 'Something else' # update the name to anything u want
artist.genre = 'Disco' # update the genre u like it to

repo.update(artist) # this would update the artist 1

updated_artist = repo.find(1) # as this method doesn't return anything, we use fresh find to look for the updated artist

updated_artist.name  # => 'Something else'
updated_artist.genre # => 'Disco'

# eg 7 for - DATABASES: CH 7 - Test-driving write operations - update method for just name
<!- Create a new artist -->
user_repo = UserRepository.new

  artist = repo.find(1) #  find artist 1
  
  artist.name = 'Jubin' # update the name to anything u want
  
  repo.update(artist) # this would update the artist 1
  
  updated_artist = repo.find(1) # as this method doesn't return anything, we use fresh find to look for the updated artist
  
  expect(updated_artist.name).to eq ('Jubin')
  expect(updated_artist.genre).to eq ('Indian Music')

# 7. Reload the SQL seeds before each test run




