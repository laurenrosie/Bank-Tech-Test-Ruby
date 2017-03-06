require 'spec_helper'
require './lib/account'


describe '3. Withdraw from an account' do

  it 'returns a message confirming withdrawal and new balance' do
    my_account = Account.new()
    my_account.deposit(100)
    expect(my_account.withdraw(50)).to eq '£50 has been successfully withdrawn. The current balance is £50'
  end

  it 'returns an error if withdrawal amount exceeds account balance' do
    my_account = Account.new()
    my_account.deposit(100)
    expect(my_account.withdraw(200)).to eq 'This withdrawal could not be completed due to insufficient funds'
  end

end
