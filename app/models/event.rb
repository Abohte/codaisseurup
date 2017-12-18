class Event < ApplicationRecord
  BARGAIN_PRICE = 10

  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  has_many :photos, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :ends_at_after_starts_at

  def ends_at_after_starts_at
    return true if !(starts_at && ends_at)

    if ends_at <= starts_at
      errors.add(:expiration_date, "- endtime has to be later than starttime")
    end
  end

  def bargain?
    price < BARGAIN_PRICE
  end

  def self.order_by_price
    order :price
  end

end
