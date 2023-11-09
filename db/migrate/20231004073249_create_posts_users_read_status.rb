class CreatePostsUsersReadStatus < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_users_read_status do |t|
      t.belongs_to :post
      t.belongs_to :user
    end

    add_index :posts_users_read_status, [:post_id, :user_id], unique: true
  end
end
