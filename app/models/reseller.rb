class Reseller < ApplicationRecord
  
  # has_and_belongs_to_many :manufacturers
  
  has_many :distributions
  has_many :manufacturers, through: :distributions
  has_many :addresses, as: :addressable
end
