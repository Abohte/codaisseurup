class Registration < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  validates :guest_count, numericality: { less_than_or_equal_to: 3,  only_integer: true }

  def set_total_price
    self.price = event.price
    self.total = price * guest_count
  end
end
