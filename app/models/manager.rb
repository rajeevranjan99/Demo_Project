class Manager < ApplicationRecord
  belongs_to :user
  has_many :schedules
end
