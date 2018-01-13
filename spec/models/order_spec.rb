require 'rails_helper'

describe Order do
  before :each do
    @user = User.create
  end

  it '应该正确创建订单' do
    Order.create(user: @user)
    expect(Order.count).to eq 1
  end

end