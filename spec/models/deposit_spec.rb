require 'spec_helper'
require './lib/transaction'

describe Transaction do
  subject(:my_transaction){described_class.new(200)}
  it 'intializes with an amount' do
    expect(my_transaction.amount).to eq 200
  end

  it 'records the current date of the deposit if not specified' do
    expect(my_transaction.date).to eq(Date.today.strftime("%d/%m/%Y"))
  end

  it 'records the date of the deposit if specified' do
    dated_transaction = Transaction.new(200, "01/01/2011")
    expect(dated_transaction.date).to eq "01/01/2011"
  end

  it 'records the current date of the deposit if not specified' do
    expect(my_transaction.date).to eq(Date.today.strftime("%d/%m/%Y"))
  end
end
