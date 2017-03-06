require 'spec_helper'
require './lib/account'
require 'models/helpers'


describe '4. Print a statement' do
  it 'returns the right log of transactions' do
    account = acceptance_account_creation
    expected_output = "date       || credit || debit   || balance\n14/01/2012 ||        || 500.00  || 2500.00\n13/01/2012 || 2000.00||         || 3000.00\n10/01/2012 || 1000.00||         || 1000.00\n"
    expect{account.print_statement}.to output(expected_output).to_stdout
  end
end
