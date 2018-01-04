class CartAPI < Grape::API
  include Grape::Kaminari

  resources :carts do
    desc '获取购物车商品列表'
    get do
      line_items = current_user.cart.line_items
      present line_items, with: Entities::LineItem
    end

    desc '添加商品到购物车'
    params do
      requires :variant_id, type: Integer, desc: '版本ID'
      requires :quantity, type: Integer, desc: '数量'
    end
    post :add do
      current_user.cart.add(variant, quantity)
      present current_user.cart, with: Entities::Cart
    end

    desc '从购物车移除商品'
    params do
      requires :line_item_id, type: Integer, desc: '商品项ID'
    end
    post :remove do
      line_item = LineItem.find(params[:line_item_id])
      current_user.cart.remove(line_item)
      present current_user.cart, with: Entities::Cart
    end
  end
end
