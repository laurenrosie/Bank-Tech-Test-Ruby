require 'date'

class Transaction

  attr_reader :amount, :date

  def initialize(amount, date=nil)
    @amount = amount
    @date = get_date(date)
  end

  def get_date(date)
    date ? date :  Date.today.strftime("%d/%m/%Y")
  end

end
