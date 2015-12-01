class ExpensesController < ApplicationController

  before_action :authenticate_user!, :ensure_house_exists, :get_house
  before_action :verified_phone, :if => :wants_sms?

  def index
    @expenses = @house.expenses.all.page(params[:page])
    @expense = Expense.new
    @housemates = @house.users
  end

  def create
    #first checks to see if expense row has been updated.
    #Due to the 'has_and_belongs_to_many' relationhip with users,
    #the method then checks to see if it can update the expenses_users table
    @expense = Expense.new(expense_params)
    @expense.owner = current_user
    @expense.house = @house
    @expense.points_rewarded = 1000

    respond_to do |format|
      if @expense.save
        @expense.text_sender
        @house.email_about_expenses(@expense)
        format.html { redirect_to house_expenses_path(current_user.house), notice: 'expense added.' }
        format.js {}

      else
        format.html { render :index, alert: 'There was an error.'  }
        format.js { render status: '422'}
      end
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    payments = Payment.where(expense_id: params[:id])
    payments.destroy_all

    respond_to do |format|
      format.html {redirect_to house_expenses_path(current_user.house)}
      format.js
    end

  end

  def update
    @expense = Expense.find(params[:id])

    #first checks to see if expense row has been updated.
    #Due to the 'has_and_belongs_to_many relationhip' with users,
    #the method then checks to see if it can update the expenses_users table
    @expense.update_attributes(expense_params)
    redirect_to house_expense_path(current_user.house_id, @expense)
  end

  def show
    @user_payments = Payment.where(user_id: current_user.id)
  end

  private
  def expense_params
    params.require(:expense).permit(:title, :amount, :points_rewarded, :date_due, :owner_id, :user_ids => [])
  end

end
