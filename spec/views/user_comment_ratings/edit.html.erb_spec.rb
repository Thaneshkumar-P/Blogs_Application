require 'rails_helper'

RSpec.describe "user_comment_ratings/edit", type: :view do
  let(:user_comment_rating) {
    UserCommentRating.create!(
      user: nil,
      comment: nil,
      rating: 1
    )
  }

  before(:each) do
    assign(:user_comment_rating, user_comment_rating)
  end

  it "renders the edit user_comment_rating form" do
    render

    assert_select "form[action=?][method=?]", user_comment_rating_path(user_comment_rating), "post" do

      assert_select "input[name=?]", "user_comment_rating[user_id]"

      assert_select "input[name=?]", "user_comment_rating[comment_id]"

      assert_select "input[name=?]", "user_comment_rating[rating]"
    end
  end
end
