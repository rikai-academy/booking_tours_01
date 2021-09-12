require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    @category = assign(:category, Category.new(category_name: "food"))
  end

  it 'renders the edit post form' do
    render
    assert_select 'form[action=?][method=?]', categories_path, 'post' do
      assert_select 'input[name=?]', 'category[category_name]'
    end
  end
end
