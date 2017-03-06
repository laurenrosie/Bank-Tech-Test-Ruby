require './lib/transaction'
require './lib/statement'

class Account

  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount, date = nil)
    @current_balance += amount
    create_transaction(amount, @current_balance, date)
    transaction_success_message(amount)
  end

  def withdraw(amount, date = nil)
    sufficient_balance?(amount) ? perform_withdrawal(amount, date) : withdrawal_rejection_message
  end

  def print_statement
    Statement.new(self).print_statement
  end

  private

  def perform_withdrawal(amount, date)
    @current_balance -= amount
    create_transaction(-amount, @current_balance, date)
    transaction_success_message(-amount)
  end

  def create_transaction(amount, new_balance, date)
    @transactions << Transaction.new(amount, new_balance, date)
  end

  def sufficient_balance?(amount)
    amount <= @current_balance
  end

  def transaction_success_message(amount)
      action = (amount >=0 ? "deposited" : "withdrawn")
      "£#{amount.abs} has been successfully #{action}. The current balance is £#{@current_balance}"
  end

  def withdrawal_rejection_message
    "This withdrawal could not be completed due to insufficient funds"
  end

end
