require 'spec_helper'
require './lib/deposit'

describe Deposit do
  subject(:my_deposit){described_class.new(200)}
  it 'intializes with an amount' do
    expect(my_deposit.amount).to eq 200
  end

  it 'records the current date of the deposit if not specified' do
    expect(my_deposit.date).to eq(Date.today.strftime("%d/%m/%Y"))
  end

  it 'records the date of the deposit if specified' do
    dated_deposit = Deposit.new(200, "01/01/2011")
    expect(dated_deposit.date).to eq "01/01/2011"
  end

  it 'records the current date of the deposit if not specified' do
    expect(my_deposit.date).to eq(Date.today.strftime("%d/%m/%Y"))
  end
end
