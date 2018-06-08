class HomeController < ApplicationController
  def index
    @queries = Query.includes(:category).limit(10).order(:updated_at).reverse_order
    @categories = Category.all.order(:id)
  end
end
