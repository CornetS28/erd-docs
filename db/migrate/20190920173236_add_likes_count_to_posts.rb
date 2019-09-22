class AddLikesCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :likes_count, :integer
    Post.find_each do |post| 
      Post.reset_counters(post.id, :likes)
    end
  end
end
