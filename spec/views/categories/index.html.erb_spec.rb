require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    Category.create!(category_name: "Food")
    Category.create!(category_name: "Place")
    @categories = Category.page(params[:page])
  end

  it 'renders a list of categories' do
    render
    assert_select 'tr>td', text: 'Food'.to_s, count: 1
    assert_select 'tr>td', text: 'Place'.to_s, count: 1
  end
end
