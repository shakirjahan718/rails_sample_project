class Distribution < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :reseller
  belongs_to :manufacturer
end
