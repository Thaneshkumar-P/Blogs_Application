class CreatePostsTagsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_tags, id: false do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end

    add_index :posts_tags, [:post_id, :tag_id], unique: true
  end
end
