class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.references :user, foreign_key: true
      t.string :month
      t.integer :amount

      t.timestamps
    end
  end
end
