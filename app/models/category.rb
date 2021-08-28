class Category < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :parent, class_name: :Category, inverse_of: :children, foreign_key: :parent_id, required: false
  has_many :children, class_name: :Category, inverse_of: :parent, foreign_key: :parent_id, dependent: :destroy
  validates :category_name, presence: true, length: { maximum: 50}

  scope :top_level, -> { where("parent_id = ?", 0) }

  def descendents
    children.map do |child|
      [child] + child.descendents
    end.flatten
  end

  def self_and_descendents
    [self] + descendents
  end

  def descendent_reviews
    self_and_descendents.map(&:reviews).flatten
  end
end
