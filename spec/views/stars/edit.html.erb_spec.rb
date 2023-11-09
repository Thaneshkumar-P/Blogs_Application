require 'rails_helper'

RSpec.describe "stars/edit", type: :view do
  let(:star) {
    Star.create!(
      star: 1
    )
  }

  before(:each) do
    assign(:star, star)
  end

  it "renders the edit star form" do
    render

    assert_select "form[action=?][method=?]", star_path(star), "post" do

      assert_select "input[name=?]", "star[star]"
    end
  end
end
