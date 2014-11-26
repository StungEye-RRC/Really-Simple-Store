class StoreController < ApplicationController
  before_action :load_favourite_product, except: :save_favourite_product
  
  def index
    @products = Product.all
    
    if session[:visit_count]
      @visit_count = session[:visit_count] + 1
    else
      @visit_count = 1
    end
    
    session[:visit_count] = @visit_count
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
  
  def save_favourite_product
    session[:favourite_product_id] = params[:id].to_i
    redirect_to :back
  end
  
  private
  def load_favourite_product
    if session[:favourite_product_id]
      @favourite_product = Product.find(session[:favourite_product_id])
    else
      @favourite_product = false
    end
  end
end
