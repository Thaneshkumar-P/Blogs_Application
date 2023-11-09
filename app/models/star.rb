class Star < ApplicationRecord
  belongs_to :post

  after_save :update_average_rating

  def update_average_rating
    post.update_avg_rating
  end
end
