class Offer < ApplicationRecord
  belongs_to :proposer
  has_many :bargains
  has_many :stores, through: :bargains

  validates :name, :price, :proposer_id, presence: true
  validates_associated :proposer
  after_validation :correct_price

  def correct_price
    price >= 0
  end

  scope :only_items, -> { where(measure: 'шт') }
end
