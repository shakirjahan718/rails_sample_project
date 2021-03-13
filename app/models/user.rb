class User < ApplicationRecord
  attr_accessor :first_name, :last_name, :timezone
  # validates :first_name, presence: true, length: { minimum: 10 }
  # validates :first_name, presence: {message: "should be present"}
  # validates :last_name, presence: true
  # validates :points, numericality: true
  # validates :age, presence: true, numericality: true
  # validates :name, uniqueness: true
  # custom validation in rails
  # validate :check_name_unique

  belongs_to :city
  has_one :address, as: :addressable

  #callbacks
  before_save :set_full_name
  CITIES = %W/Lahore Karachi Multan Islambad/

  def gender_string
    gender == "F" ? "FEMALE" : "MALE"
  end

  def self.authenticate(username , password)
    self.find_by_name(username)
  end

  # custom validation in rails
  def check_name_unique
    exists = User.find_by_name(first_name + " " + last_name).nil? ? false : true
    self.errors.add(:name, "is already taken.")
  end
  

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_full_name
    self.name = first_name+" "+ last_name
  end

  def firstname
    name.split(/\s/).first
  end

  def lastname
    name.split(/\s/).last
  end

  def city_name
    if self.city.present?
      self.city.name
    else
      "No Data"
    end
  end
  
  
end
