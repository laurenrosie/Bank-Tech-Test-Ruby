require 'spec_helper'
require './lib/account'
require './lib/deposit'


describe Account do

  subject(:my_account){described_class.new()}
  it 'has initial balance 0' do
    expect(my_account.current_balance).to eq 0
  end

  it 'has initial transactions []]' do
    expect(my_account.transactions).to eq []
  end

  describe '#deposit' do
    it 'changes account balance by given amount' do
      my_account.deposit(200)
      expect(my_account.current_balance).to eq 200
    end


    it 'creates an instance of the class deposit' do
      expect(Deposit).to receive(:new).with(200)
      my_account.deposit(200)

    end
    it 'adds the deposit to the account\'s transactions' do
      my_account.deposit(200)
      expect(my_account.transactions.count).to eq 1
    end


  end
end
