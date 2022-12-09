class Bargain < ApplicationRecord
  belongs_to :store
  belongs_to :offer

  validates :created_at, :updated_at, :status, :offer_id, :store_id, :date, presence: true
  validates_associated :store, :offer
  after_validation :correct_status

  private
  def correct_status
    status == "Considering" || status == "Accepted"
  end
end
