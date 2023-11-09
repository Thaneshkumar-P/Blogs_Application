require 'rails_helper'

RSpec.describe "stars/index", type: :view do
  before(:each) do
    assign(:stars, [
      Star.create!(
        star: 2
      ),
      Star.create!(
        star: 2
      )
    ])
  end

  it "renders a list of stars" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
