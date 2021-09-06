class ApplicationRecord < ActiveRecord::Base
  include TimeToStatistic
  self.abstract_class = true
end