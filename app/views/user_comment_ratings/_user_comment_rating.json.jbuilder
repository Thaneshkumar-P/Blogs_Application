json.extract! user_comment_rating, :id, :user_id, :comment_id, :rating, :created_at, :updated_at
json.url user_comment_rating_url(user_comment_rating, format: :json)
