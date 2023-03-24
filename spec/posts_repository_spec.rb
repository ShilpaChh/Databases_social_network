require "posts_repository"
require 'pg'

RSpec.describe PostsRepository do

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

    it "gets all posts" do
        repo = PostsRepository.new

        posts = repo.all

        expect(posts.length).to eq 5

        # expect(users[0]).to eq 1
        # expect(users[0]).to eq 'Bob'
        # expect(users[0]).to eq 'Bob@googlemail.com'

        # expect(users[1]).to eq 2
        # expect(users[1]).to eq 'Steve'
        # expect(users[1]).to eq 'Steve@yahoo.com'

    end

    it 'finds a specific post' do
        repo = PostsRepository.new
        post = repo.find(1)
        expect(post['id'].to_i).to eq 1
        expect(post['title']).to eq 'title1'
        expect(post['content']).to eq 'content1'
        expect(post['user_id']).to eq '1'
        expect(post['views']).to eq '0'
    end

    # (title, content, user_id, views) values
    # ('title1', 'content1', 1, 0),
    # ('title2', 'content2', 1, 4),


    it 'creates a post' do
        repo = PostsRepository.new

        repo.create('title6', 'content6', '1', '7')
        # posts = repo.all

        posts = repo.find(6)

        expect(posts['title']).to eq 'title6'
        expect(posts['content']).to eq 'content6'
        expect(posts['user_id']).to eq '1'
        expect(posts['views']).to eq '7'
    end


    it 'deletes a post' do
        repo = PostsRepository.new
        posts = repo.all
        post = repo.find(1)
        leng = posts.length

                # puts leng
                # puts repo.find(1)
                # puts repo.find(2)

                # expect(users.length).to eq 2
        expect(post['title']).to eq 'title1'
        expect(post['content']).to eq 'content1'

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

    it "updates a post" do
        repo = PostsRepository.new
        post = repo.find(1)

        # expect(user['id'].to_i).to eq 1
        # expect(user['username']).to eq 'Bob'
        # expect(user['email_address']).to eq 'Bob@googlemail.com'
    
        # puts user
        # user['username'] = 'Test'
        post['title'] = 'Maido and Shilpa'

        # updated_user = repo.find(1)
        repo.update(post)
        updated_post = repo.find(1)

        # puts updated_user
        # expect(user['id'].to_i).to eq 1
        expect(updated_post['title']).to eq 'Maido and Shilpa'

    end


end