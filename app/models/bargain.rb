class Bargain < ApplicationRecord
  belongs_to :store
  belongs_to :offer

  validates :status, :offer_id, :store_id, :date, presence: true
  validates_associated :store, :offer
  after_validation :correct_status

  private
  def correct_status
    status == "Considering" || status == "Accepted"
  end

  scope :most_recent, -> { where("date > ?", 2.weeks.ago) }
end
