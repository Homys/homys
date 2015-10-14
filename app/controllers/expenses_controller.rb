class ExpensesController < ApplicationController

  before_action :authenticate_user!, :ensure_house_exists, :get_house

  def index
    @expenses = Expense.all
    @expense = Expense.new
  end

  def create
    #first checks to see if expense row has been updated.
    #Due to the 'has_and_belongs_to_many' relationhip with users,
    #the method then checks to see if it can update the expenses_users table
    @expense = Expense.new(expense_params)
    @expense.owner_id = current_user.id

    respond_to do |format|
      if @expense.save
        format.html { redirect_to house_expenses_path(current_user.house), notice: 'expense added.' }
        format.js {}

      else
        format.html { render :index, alert: 'There was an error.'  }
        format.js {}
      end
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to house_expenses_path(current_user.house_id)
  end

  def update
    @expense = Expense.find(params[:id])

    #first checks to see if expense row has been updated.
    #Due to the 'has_and_belongs_to_many relationhip' with users,
    #the method then checks to see if it can update the expenses_users table
    @expense.update_attributes(expense_params)
    redirect_to house_expense_path(current_user.house_id, @expense)

  end
  private
  def expense_params
    params.require(:expense).permit(:title, :amount, :date_due, :owner_id, :user_ids => [])
  end

  # def text_sender(body)
  #   expense.users.each do |user|
  #     user.send_text_message(body)
  #   end
  # end

  # def expense_text
  #   body: "You owe #{owner_id} #{amount}. Due #{due_date} days."
  # end

  # def auto_text
  #   send_text_message.due_date - 7.days
  # end

end
