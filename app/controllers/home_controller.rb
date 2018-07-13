class HomeController < ApplicationController
	before_action :authenticate_user!

  def index
  	
  end

  def reports
  	# @total_expenses = Expense.where(user_id: current_user.id).sum(:amount)
  	# @total_income = Income.where(user_id: current_user.id).sum(:amount)
  	# @total_savings = @total_income - @total_expenses
  	render "home/report"
  end

  def load_report_data
    start_date_of_month = Date.parse("01-#{ params[:month] }-#{ Date.today.year }")
    end_date_of_month = start_date_of_month.end_of_month
    total_expenses = Expense.where(
      user_id: current_user.id,
      expense_date: start_date_of_month..end_date_of_month
    ).sum(:amount)
    total_income = Income.where(
      user_id: current_user.id,
      month: params[:month]
    ).sum(:amount)
    
    render json: {
      total_income: total_income,
      total_expenses: total_expenses,
      savings: total_income - total_expenses
    }, status: :ok
  end
end
