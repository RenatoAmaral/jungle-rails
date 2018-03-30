class Review < ActiveRecord::Base
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true

  def blank_stars
    5 - rating.to_i
  end

end
# Validetions
# Is a review without a product (parent) valid?
# Is a review without a user (reviewer) valid?
# Is a review with no description valid?
# Is a review with no rating valid?
