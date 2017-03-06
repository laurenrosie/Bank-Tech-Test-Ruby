require 'date'

class Transaction

  attr_reader :amount, :date, :new_balance

  def initialize(amount, new_balance, the_date=nil)
    @amount = amount
    @date = get_date(the_date)
    @new_balance = new_balance
  end

  private

  def get_date(date)
    date ? date :  Date.today.strftime("%d/%m/%Y")
  end

end
