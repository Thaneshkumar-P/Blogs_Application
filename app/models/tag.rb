class Tag < ApplicationRecord
  # has_many :post_tags
  # has_many :posts, through: :post_tags
  has_and_belongs_to_many :posts, join_table: "posts_tags"
end

