class Tag < ApplicationRecord
  has_many :popularity, class_name: :TagHelper, foreign_key: :tag_id, dependent: :destroy
  validates :tag_name, presence: true, length: { maximum: 50}
end
