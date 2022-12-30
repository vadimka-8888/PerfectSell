class AdminUser < ApplicationRecord
  validates :full_name, :email, :password, presence: true
  validates_uniqueness_of :email
end