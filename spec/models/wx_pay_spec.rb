require 'rails_helper'

describe WxPay do
  before :each do
    @user = User.create(openid: 'oQDAl0b_Oyb5r4gZFFfhHbmA__nw')
  end

  it '应该正确调用微信统一下单API' do
    order = Order.create(user: @user, payment_total: 0.01)
    prepay_id = WxPay.unifiedorder(@user.openid, order)
    expect(prepay_id).to match /wx/
  end

end