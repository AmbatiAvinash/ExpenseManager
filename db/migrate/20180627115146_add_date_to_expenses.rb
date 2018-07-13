class AddDateToExpenses < ActiveRecord::Migration[5.2]
  def change
  	add_column :expenses, :expense_date, :date
  end
end
