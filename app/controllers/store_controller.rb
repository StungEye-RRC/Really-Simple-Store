class StoreController < ApplicationController
  def index
    @products = Product.all
  end
  # The associated view will be loaded: app/views/store/index.html.erb
  
  def show
    @product = Product.find(params[:id])
  end
  # View: app/views/store/show.html.erb
  
  def search_results
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @products = Product.where("name LIKE ?", wildcard_keywords)
  end
  # View: app/views/store/search_results.html.erb
end
