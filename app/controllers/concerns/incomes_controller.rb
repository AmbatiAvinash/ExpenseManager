class IncomesController < ApplicationController

	def index
		@incomes = Income.where(user_id: current_user.id)
	end

	def view
	end


	def new
		@income = Income.new
	end

	def create
		@income = Income.new(income_params)
		@income.user_id = current_user.id
		if @income.save
			redirect_to incomes_path, notice: "Income has been created successfully."
		else
			render :new
		end
	end

	def edit
		@income = Income.find(params[:id])
	end

	def update
		@income = Income.find(params[:id])
		if @income.update(income_params) 
			redirect_to incomes_path
		else
			render 'edit'
		end
	end

	def destroy
		@income = Income.find(params[:id])
		@income.destroy
		redirect_to incomes_path
	end

	private
	def income_params
		params.require(:income).permit(:month,:amount)
	end
end