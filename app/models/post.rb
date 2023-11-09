class Post < ApplicationRecord

  scope :picker, -> (from, to) { where(:created_at => from...to) }

  belongs_to :topic
  # has_many :post_tags
  has_many :stars
  has_one_attached :post_image
  has_and_belongs_to_many :tags, join_table: "posts_tags"
  belongs_to :user
  has_and_belongs_to_many :users, join_table: "posts_users_read_status"

  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank

  has_many :comments, dependent: :destroy

  validates :title, length: { maximum: 20, too_long: "Should be less than %{count} characters" }
  validates :title, presence: true


  def update_avg_rating
    update_column(:rating_average, stars.average(:star))
  end
end
