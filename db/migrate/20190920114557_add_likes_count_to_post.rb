class AddLikesCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :likes_count, :integer
    Post.reset_column_information
    Post.find_each do |post| 
      post.update(likes_count: post.likes.count)
    end
  end
end
