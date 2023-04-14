class Schedule < ApplicationRecord
    belongs_to :manager 
    belongs_to :port 
    belongs_to :flight
end
