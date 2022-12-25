class Store < ApplicationRecord
  has_many :bargains
  has_many :offers, through: :bargains

  validates :name, :store_email, :store_password, presence: true
  validates_uniqueness_of :store_password

end
