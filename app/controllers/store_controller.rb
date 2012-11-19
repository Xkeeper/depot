class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @cart = current_cart
    if not session[:counter].nil?
    	session[:counter] +=1
    else
    	session[:counter] = 0
    end
    @counter = session[:counter]
  end
end
