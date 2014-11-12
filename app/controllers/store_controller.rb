class StoreController < ApplicationController
  def index
    @products = Product.all
  end
  # The associated view will be loaded: app/views/store/index.html.erb
  
  def show
    @product = Product.find(params[:id])
  end
  # View: app/views/store/show.html.erb
end
