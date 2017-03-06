require 'spec_helper'
require './lib/account'


describe '2. Deposit to an account' do
  
  it 'returns a message confirming deposit and new balance' do
    my_account = Account.new()
    expect(my_account.deposit(100)).to eq '£100 has been successfully deposited. The current balance is £100'
  end

end
