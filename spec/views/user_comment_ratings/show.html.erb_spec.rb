require 'rails_helper'

RSpec.describe "user_comment_ratings/show", type: :view do
  before(:each) do
    assign(:user_comment_rating, UserCommentRating.create!(
      user: nil,
      comment: nil,
      rating: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
