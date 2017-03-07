require './lib/transaction'

class Account

  attr_reader :current_balance, :transactions, :transaction_class

  def initialize()
    @current_balance = 0
    @transactions = []
    @transaction_class = Transaction
  end

  def deposit(amount, date = nil)
    amount > 0 ? perform_deposit(amount, date) : deposit_rejection_message
  end

  def withdraw(amount, date = nil)
    sufficient_balance?(amount) ? perform_withdrawal(amount, date) : withdrawal_rejection_message
  end


  private

  def perform_deposit(amount, date)
    @current_balance += amount
    create_transaction(amount, @current_balance, date)
    transaction_success_message(amount)
  end

  def perform_withdrawal(amount, date)
    @current_balance -= amount
    create_transaction(-amount, @current_balance, date)
    transaction_success_message(-amount)
  end

  def create_transaction(amount, new_balance, date)
    @transactions << @transaction_class.new(amount, new_balance, date)
  end

  def sufficient_balance?(amount)
    amount <= @current_balance
  end

  def transaction_success_message(amount)
      action = (amount >=0 ? "deposited" : "withdrawn")
      "£#{amount.abs} has been successfully #{action}. The current balance is £#{@current_balance}"
  end

  def deposit_rejection_message
    'This deposit could not be completed. The deposit amount must be positive'
  end

  def withdrawal_rejection_message
    "This withdrawal could not be completed due to insufficient funds"
  end

end
