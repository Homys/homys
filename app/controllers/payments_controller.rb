class PaymentsController < ApplicationController
  def paid

  	payment = Payment.find(params[:payment_id])
  	payment.paid = 1
  	payment.save

  	redirect_to house_expenses_path

  end
end
