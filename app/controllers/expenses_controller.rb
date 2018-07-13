class ExpensesController < ApplicationController

	before_action :set_expense, only: [:edit, :show, :update, :destroy]

	def index
		@expenses = Expense.where(user_id: current_user.id)
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		@expense.user_id = current_user.id
		if @expense.save
			redirect_to root_path, notice: "Expense has been created successfully."
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @expense.update(expense_params)
			redirect_to root_path, notice: "Expense has been updated successfully."
		else
			render :edit
		end
	end

	def show

	end

	def destroy
		@expense.destroy 
		redirect_to root_path		
	end

	private
		def expense_params
			params.require(:expense).permit(:name,:expense_date,:type,:amount)
		end

		def set_expense
			@expense = Expense.find(params[:id])
		end
end