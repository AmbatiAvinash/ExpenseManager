class Income < ApplicationRecord
  belongs_to :user
  validates_presence_of :amount,:month, message: "field required"
  validates :amount, numericality: { only_integer: true }
end
