class Expense < ApplicationRecord
	self.inheritance_column = :_type_disabled
  
  belongs_to :user

  validates_presence_of :name,:expense_date, :type, message: "field required"
  validates :amount, numericality: { only_integer: true }

end
