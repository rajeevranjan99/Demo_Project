class Admin < ApplicationRecord
  belongs_to :airport
  belongs_to :user
  has_one :manager 
  accepts_nested_attributes_for :manager
  accepts_nested_attributes_for :user
end
