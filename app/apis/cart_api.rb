class CartAPI < Grape::API
  include Grape::Kaminari

  resources :carts do
    desc '获取购物车商品列表'
    get do
      present current_user.cart, with: Entities::Cart
    end

    desc '添加商品到购物车'
    params do
      requires :variant_id, type: Integer, desc: '版本ID'
      requires :quantity, type: Integer, desc: '数量'
    end
    post :add do
      current_user.cart.add(params[:variant_id], params[:quantity])
      status 200
      present current_user.cart, with: Entities::Cart
    end

    desc '从购物车移除商品'
    params do
      requires :line_item_id, type: Integer, desc: '商品项ID'
    end
    post :remove do
      line_item = LineItem.find(params[:line_item_id])
      current_user.cart.remove(line_item)
      status 200
      present current_user.cart, with: Entities::Cart
    end

    desc '更新购物车商品'
    params do
      requires :line_item_id, type: Integer, desc: '商品项ID'
      requires :quantity, type: Integer, desc: '数量'
    end
    post :update do
      line_item = LineItem.find(params[:line_item_id])
      line_item.update(quantity: params[:quantity])
      status 200
      present current_user.cart, with: Entities::Cart
    end

    desc '勾选商品项'
    params do
      requires :line_item_id, type: Integer, desc: '商品项ID'
      requires :checked, type: Boolean, desc: 'true 勾选，false 未勾选'
    end
    post :check do
      line_item = LineItem.find(params[:line_item_id])
      line_item.update(checked: params[:checked])
      status 200
      present current_user.cart, with: Entities::Cart
    end

    params do
      requires :checked, type: Boolean, desc: 'true 勾选，false 未勾选'
    end
    post :check_all do
      current_user.cart.line_items.update_all(checked: params[:checked])
      status 200
      present current_user.cart, with: Entities::Cart
    end
  end
end
