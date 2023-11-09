require 'rails_helper'

RSpec.describe "user_comment_ratings/index", type: :view do
  before(:each) do
    assign(:user_comment_ratings, [
      UserCommentRating.create!(
        user: nil,
        comment: nil,
        rating: 2
      ),
      UserCommentRating.create!(
        user: nil,
        comment: nil,
        rating: 2
      )
    ])
  end

  it "renders a list of user_comment_ratings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
