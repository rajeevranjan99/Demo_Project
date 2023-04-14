class Port < ApplicationRecord
  belongs_to :airport
  has_and_belongs_to_many :flights
  has_many :ports
end
