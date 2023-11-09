class AddTopicIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :topic, null: false, foreign_key: true
  end
end
