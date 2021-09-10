require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let(:valid_attributes) do
    {
      id: 1,
      category_name: "Food"
    }
  end

  let(:invalid_attributes) do
    {
      id: 1,
      category_name: ""
    }
  end

  describe "GET /index" do
    it "render successful response" do
      Category.create! valid_attributes
      get categories_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "create a new category" do
      expect do
        post categories_url, params: {category: valid_attributes} 
      end.to change(Category, :count).by(1)
      expect(response).to redirect_to categories_path
    end
    
    it "create a new category" do
      expect do
        post categories_url, params: {category: invalid_attributes} 
      end.to change(Category, :count).by(0)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      category = Category.create! valid_attributes
      get edit_category_url(id: category.id)
      expect(response).to be_successful  
    end
  end

  describe "DELETE /destroy" do
    it 'checks that a category can be destroyed' do
      category = Category.create! valid_attributes
      delete category_url(id: category.id), params: {category_name: "food"}
      expect(Category.find_by(category_name: "Food")).to be_nil
    end

    it "redirect to categories_path" do
      category = Category.create! valid_attributes
      delete category_url(id: category.id), params: {category_name: "food"}
      expect(response).to redirect_to categories_path
    end
  end

  describe "PATH /update" do
    it 'checks that a category can be updated' do
      category = Category.create! valid_attributes
      category.update(:category_name => "Place")
      expect(Category.find_by(category_name: "Place")).to eq(category)
    end
    
    it "redirect to categories_path" do
      category = Category.create! valid_attributes
      category.update(:category_name => "Place")
      expect(response).to redirect_to categories_path
    end
  end
end
