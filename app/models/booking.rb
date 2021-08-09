class Booking < ApplicationRecord
  enum status: { pending: 0, failed: 1, paid: 2}
  
  belongs_to :user
  belongs_to :tour
end
