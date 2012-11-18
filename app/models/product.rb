class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, :image_url, :title, presence: { message: 'should be present'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|png|jpg)$}i
  }
  validates :title, length: { minimum: 10 }


end
