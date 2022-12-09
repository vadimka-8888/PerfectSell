class Proposer < ApplicationRecord
  has_many :offers

  validates :full_name, :email, :password, :created_at, :updated_at, presence: true
  validates_uniqueness_of :email
end
