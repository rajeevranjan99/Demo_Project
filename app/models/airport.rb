class Airport < ApplicationRecord
    has_many :ports 
    has_many :flights
    has_one :admin
end
