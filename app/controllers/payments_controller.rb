class PaymentsController < ApplicationController

  before_action :authenticate_user!, :ensure_house_exists
  before_action :verified_phone, :if => :wants_sms?

  def paid
  	payment = Payment.find(params[:payment_id])
  	expense = Expense.find(params[:expense_id])
  	user = User.find(payment.user_id)
  	user.total_points += expense.points_rewarded

  	payment.paid = 1
  	user.save
  	payment.save

  	redirect_to house_expenses_path

  end
end
