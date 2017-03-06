require 'spec_helper'
require './lib/account'

describe '1. Create an Account' do
  it 'does not raise an error' do
    expect{Account.new()}.not_to raise_error
  end

  it 'creates an object of type Account' do
    my_account = Account.new
    expect(my_account).to be_a(Account)
  end

end
