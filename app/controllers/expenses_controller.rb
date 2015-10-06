class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.owner_id = current_user.id

    if @expense.save
      redirect_to expense_url(@expense)
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def destroy
  end

  def update
    @expense = Expense.find(params[:id])

    @expense.update_attributes(expense_params)

    redirect_to expense_path(@expense)

  end
  private
  def expense_params
    params.require(:expense).permit(:title, :amount, :date_due, :owner_id, :user_ids => [])
  end
end
