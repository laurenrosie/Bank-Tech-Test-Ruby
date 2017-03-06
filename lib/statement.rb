class Statement

  COLUMN_WIDTH = 8

  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement
    print_header
    print_body
    
  end


  private

  def print_header
    puts "date       || credit || debit   || balance\n"
  end

  def print_body
    @account.transactions.reverse.each do |transaction|
      puts print_line(transaction)
    end
  end

  def print_line(transaction)
    print transaction.date + " ||"
    print credit_column(transaction.amount) + "||"
    print debit_column(transaction.amount) + "||"
    print balance_column(transaction.new_balance)
  end

  def credit_column(amount)
    column = float(amount).rjust(COLUMN_WIDTH, " ")
    amount > 0 ? column : " "*COLUMN_WIDTH
  end

  def debit_column(amount)
    column = float(amount.abs).center(COLUMN_WIDTH+1, " ")
    amount < 0 ? column : " "*(COLUMN_WIDTH+1)
  end

  def balance_column(balance)
    float(balance).rjust(COLUMN_WIDTH, " ")
  end

  def float(number)
    sprintf('%.2f', number)
  end

end
