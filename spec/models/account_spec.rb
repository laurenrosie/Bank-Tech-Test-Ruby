require 'spec_helper'
require './lib/account'
require './lib/transaction'


describe Account do

  subject(:my_account){described_class.new()}

  it 'has initial balance 0' do
    expect(my_account.current_balance).to eq 0
  end

  it 'has initial transactions []' do
    expect(my_account.transactions).to eq []
  end

  describe '#deposit' do

    it 'changes account balance by given amount' do
      my_account.deposit(200)
      expect(my_account.current_balance).to eq 200
    end


    it 'creates an instance of the class deposit' do
      expect(my_account.transaction_class).to receive(:new).with(200, 200, nil)
      my_account.deposit(200)
    end

    it 'adds the deposit to the account\'s transactions' do
      expect{my_account.deposit(200)}.to change{my_account.transactions.count}.by(1)
    end


    it 'records the date of the deposit if specified' do
      expect(my_account.transaction_class).to receive(:new).with(100,100,"01/01/2016" )
      my_account.deposit(100, "01/01/2016")
    end
  end

  describe '#withdraw' do

    before do
      my_account.deposit(200)
    end

    it 'changes account balance by given amount' do
      my_account.withdraw(100)
      expect(my_account.current_balance).to eq 100
    end


    it 'creates an instance of the class withdrawal' do
      expect(my_account.transaction_class).to receive(:new).with(-100, 100, nil)
      my_account.withdraw(100)

    end

    it 'adds the deposit to the account\'s transactions' do
      expect{my_account.withdraw(100)}.to change{my_account.transactions.count}.by(1)
    end

    it 'records the date of the withdrawal if specified' do
      expect(my_account.transaction_class).to receive(:new).with(-100, 100, "02/01/2016" )
      my_account.withdraw(100, "02/01/2016")
    end
  end


end
