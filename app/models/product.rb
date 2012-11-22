class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, :image_url, :title, presence: { message: 'should be present'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif|png|jpg)$}i
  }
  validates :title, length: { minimum: 10 }

  has_many :line_items

  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
	else
  		errors.add(:base, 'line items not empty')
  		return false
  	end
  end

end
