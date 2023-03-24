require "posts"
require 'pg'

RSpec.describe Posts do

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

    it "find posts" do
        post = Posts.new(1, 'title1', 'content1', 0, 1)
        expect(post.id).to eq 1
        expect(post.title).to eq 'title1'
        expect(post.content).to eq 'content1'
        expect(post.views).to eq 0
        expect(post.user_id).to eq 1

    end
end