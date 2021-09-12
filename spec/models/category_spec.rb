require 'rails_helper'

RSpec.describe Category, type: :model do
  subject {
    described_class.new(category_name: "Food")
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a category_name" do
    subject.category_name = nil
    expect(subject).to_not be_valid
  end

  describe "validations" do
    it { should validate_presence_of(:category_name) }
    it { should validate_length_of(:category_name).is_at_most(50)}
  end

  describe "Associations" do
    it { should have_many(:reviews).dependent(:destroy) }
  end

end
