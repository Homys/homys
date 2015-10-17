module ExpensesHelper

	def payment_paid_link(house, expense, user)
	  house_expense_payment_paid_path(current_user.house, expense.id, payment_id_for_user(expense, user))
	end

	def payment_id_for_user(expense, user)
	  expense.payments.find_by_user_id(user.id)
	end

	def user_payment_status(expense, user)
		Payment.find(payment_id_for_user(expense, user).id)
	end

  def current_user_expense(user_payment)
    Expense.find(user_payment.expense_id)
  end

end
