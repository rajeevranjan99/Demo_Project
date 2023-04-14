class Flight < ApplicationRecord
  belongs_to :airport
  has_and_belongs_to_many :ports
  has_many :schedules
end
