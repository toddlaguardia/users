# require_relative '../spec_helper'
# RSpec.describe User do
#   it 'has many posts' do
#     user = create_user('Kobe Bryant')
#     post1 = user.posts.new(content: 'First post')
#     post2 = user.posts.new(content: 'Second post')
#     expect(user.posts).to include(post1)
#     expect(user.posts).to include(post2)
#   end
#   it 'deletes associated posts' do
#     user = create_user('Kobe Bryant')
#     user.posts.create(content: 'Post')
#     expect {
#       user.destroy
#     }.to change(Post, :count).by(-1)
#   end
# end