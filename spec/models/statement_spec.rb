require 'spec_helper'
require './lib/account'
require './lib/statement'
require_relative './helpers'


describe Statement do

  subject(:account_double){double()}
  subject(:my_statement){described_class.new(account_double)}

  it 'intializes with an account' do
    expect(my_statement.account).to eq account_double
  end

  describe '#print_statement' do
    it 'prints the desired format of the transactions' do

    end
  end
end
