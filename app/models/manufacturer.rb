class Manufacturer < ApplicationRecord
  has_many :products, dependent: :destroy
  # has_and_belongs_to_many :resellers
  has_many :distributions
  has_many :resellers, through: :distributions
  has_many :addresses, as: :addressable
  
  #Callbacks
  before_validation :before_validation
  after_validation :after_validation
  before_save :before_save
  # around_save :around_save
  before_create :before_create
  # around_create :around_create
  after_create :after_create
  after_save :after_save
  after_commit :after_commit
  before_destroy :before_destroy
  # around_destroy :around_destroy
  after_destroy :after_destroy

  def before_validation
    puts "..................Before Validation............."
  end

  def after_validation
    puts "..................After Validation............."
  end

  def before_save
    puts "..................Before Save............."
  end

  def around_save
    puts "..................Around Save............."
  end

  def before_create
    puts "..................Before Create............."
  end

  def around_create
    puts "..................Around Create............."
  end

  def after_create
    puts "..................After Create............."
  end

  def after_save
    puts "..................After Save............."
  end

  def before_destroy
    puts "..................Before Destroy............."
  end

  def around_destroy
    puts "..................Around Destroy............."
  end

  def after_destroy
    puts "..................After Destroy............."
  end

  def after_commit
    puts "..................After Commit............."
  end
  
end
