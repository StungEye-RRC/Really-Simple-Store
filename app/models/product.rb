class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  
  scope :recent_products, -> { order(:created_at).limit(5) }
end

