require './lib/deposit'


class Account

  attr_reader :current_balance, :transactions

  def initialize
    @current_balance = 0
    @transactions = []
  end

  def deposit(amount)
    @current_balance+=amount
    @transactions << Deposit.new(amount)
    "£#{amount} has been successfully deposited. The current balance is £#{@current_balance}"
  end
end
