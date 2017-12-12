class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :ends_at_after_starts_at

  def ends_at_after_starts_at
    return true if !(starts_at && ends_at)

    if ends_at <= starts_at
      errors.add(:expiration_date, "The endtime has to be after the starttime")
    end
  end

end
