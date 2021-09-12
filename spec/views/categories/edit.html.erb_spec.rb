require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(id: 1, category_name: "food"))
  end

  it 'renders the edit post form' do
    render
    assert_select 'form[action=?][method=?]', category_path(id: @category.id), 'post' do
      assert_select 'input[name=?]', 'category[category_name]'
    end
  end
end
