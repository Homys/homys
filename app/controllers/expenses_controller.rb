class ExpensesController < PrivateController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    #first checks to see if expense row has been updated.
    #Due to the 'has_and_belongs_to_many' relationhip with users,
    #the method then checks to see if it can update the expenses_users table
    @expense = Expense.new(expense_params)
    @expense.owner_id = current_user.id

    if @expense.save
      redirect_to house_expense_url(current_user.house_id, @expense)
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
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
end
