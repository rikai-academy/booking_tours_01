class TagHelper < ApplicationRecord
  belongs_to :tag
  validates :tag_id, presence: true
  scope :this_week, -> {where created_at: Date.today.beginning_of_week..Date.today.end_of_week}
end