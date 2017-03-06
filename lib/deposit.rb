class Deposit

  attr_reader :amount, :date

  def initialize(amount, date=Date.today.strftime("%d/%m/%Y"))
    @amount = amount
    @date = date
  end

end
