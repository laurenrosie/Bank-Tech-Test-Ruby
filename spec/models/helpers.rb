def acceptance_account_creation
  account = Account.new()
  account.deposit(1000, "10/01/2012")
  account.deposit(2000, "13/01/2012")
  account.withdraw(500, "14/01/2012")
  account
end
