require 'rails_helper'

RSpec.describe "user_comment_ratings/new", type: :view do
  before(:each) do
    assign(:user_comment_rating, UserCommentRating.new(
      user: nil,
      comment: nil,
      rating: 1
    ))
  end

  it "renders new user_comment_rating form" do
    render

    assert_select "form[action=?][method=?]", user_comment_ratings_path, "post" do

      assert_select "input[name=?]", "user_comment_rating[user_id]"

      assert_select "input[name=?]", "user_comment_rating[comment_id]"

      assert_select "input[name=?]", "user_comment_rating[rating]"
    end
  end
end
