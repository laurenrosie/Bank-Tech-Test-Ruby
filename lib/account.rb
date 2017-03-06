require './lib/transaction'


class Account

  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount, date = nil)
    change_balance_by(amount)
    create_transaction(amount, date)
    transaction_success_message(amount)
  end

  def withdraw(amount, date = nil)
      sufficient_balance?(amount) ? perform_withdrawal(amount, date) : withdrawal_rejection_message
  end

  private

  def sufficient_balance?(amount)
    amount <= @current_balance
  end

  def change_balance_by(amount)
    @current_balance += amount
  end

  def transaction_success_message(amount)
      action = (amount >=0 ? "deposited" : "withdrawn")
      "£#{amount.abs} has been successfully #{action}. The current balance is £#{@current_balance}"
  end

  def withdrawal_rejection_message
    "This withdrawal could not be completed due to insufficient funds"
  end

  def create_transaction(amount, date)
    @transactions << Transaction.new(amount, date)
  end

  def perform_withdrawal(amount, date)
    change_balance_by(-amount)
    create_transaction(-amount, date)
    transaction_success_message(-amount)
  end


end
