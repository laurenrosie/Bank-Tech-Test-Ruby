require 'spec_helper'
require './lib/statement'
require_relative './helpers'


describe Statement do

  subject(:my_statement){described_class.new(my_account)}
  let(:my_account){double()}

  it 'intializes with an account' do
    expect(my_statement.account).to eq my_account
  end

  describe '#print_statement' do
    it 'prints a statement in the desired form' do
      # my_account.stub(:transactions).and_return({})
    end
  end
end
