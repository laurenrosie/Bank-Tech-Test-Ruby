require 'spec_helper'
require './lib/account'

describe Account do

  subject(:my_account){described_class.new()}

  it 'has initial balance 0' do
    expect(my_account.current_balance).to eq 0
  end

end
