require "users_repository"
require 'pg'

RSpec.describe UsersRepository do

    def reset_users_table
        seed_sql = File.read('spec/seeds_users_posts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' }) # ensure you use test DB here. 
        # This test db is used only for spec files. 
        # Note: When we run ruby app.rb, it uses the main table!
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_users_table
    end

    it "gets all users" do
        repo = UsersRepository.new

        users = repo.all

        expect(users.length).to eq 2

        # expect(users[0]).to eq 1
        # expect(users[0]).to eq 'Bob'
        # expect(users[0]).to eq 'Bob@googlemail.com'

        # expect(users[1]).to eq 2
        # expect(users[1]).to eq 'Steve'
        # expect(users[1]).to eq 'Steve@yahoo.com'

    end

    it 'finds a user' do
        repo = UsersRepository.new
        user = repo.find(1)
        expect(user['id'].to_i).to eq 1
        expect(user['username']).to eq 'Bob'
        expect(user['email_address']).to eq 'Bob@googlemail.com'

    end

    it 'creates a user' do
        repo = UsersRepository.new
        repo.create( 'Shilpa', 'Shilpa@mail.com')
        user = repo.find(3)
        # expect(user['id'].to_i).to eq 3
        expect(user['username']).to eq 'Shilpa'
        expect(user['email_address']).to eq 'Shilpa@mail.com'
    end

    it 'deletes a user' do
        repo = UsersRepository.new
        users = repo.all
        user = repo.find(1)
        leng = users.length

                # puts leng
                # puts repo.find(1)
                # puts repo.find(2)

                # expect(users.length).to eq 2
        expect(user['username']).to eq 'Bob'
        expect(user['email_address']).to eq 'Bob@googlemail.com'

        repo.delete('1')

            # puts users
            # puts 'here'
            # puts repo.all

        # user = repo.find(1)
        # users = repo.all

        expect(repo.all.length).to eq leng-1
        # expect(user['id'].to_i).to eq 1
        # expect(user['username']).to eq nil
        # expect(user['email_address']).to eq nil
    end

    it "updates a user" do
        repo = UsersRepository.new
        user = repo.find(1)

        # expect(user['id'].to_i).to eq 1
        # expect(user['username']).to eq 'Bob'
        # expect(user['email_address']).to eq 'Bob@googlemail.com'
    
        # puts user
        # user['username'] = 'Test'
        user['email_address'] = 'Bob2@googlemail.com'

        # updated_user = repo.find(1)
        repo.update(user)
        updated_user = repo.find(1)

        # puts updated_user
        # expect(user['id'].to_i).to eq 1
        #expect(user['username']).to eq 'Bob'
        expect(updated_user['email_address']).to eq 'Bob2@googlemail.com'

    end


end