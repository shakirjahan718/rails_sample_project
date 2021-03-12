class Product < ApplicationRecord
  # custom message
  # validates :name, presence: {message: 'should be present'}
  validates :model, presence: true
  belongs_to :manufacturer, optional: true
  has_many :distributions

  #scopes
  scope :premium, -> { where("price > 10000") }
  scope :get_by_price, -> (price) { where("price > ?", price) }
  scope :get_manufacturer_products, -> (manufacturer_id) { where("manufacturer_id = ?", manufacturer_id) }
  
  #pagination
  self.per_page = 5

  # set per_page globally
  # WillPaginate.per_page = 3
end
