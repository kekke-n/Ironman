class HomeController < ApplicationController
  def index
    @queries = Query.includes(:category).all.order(:updated_at).limit(10)
    @categories = Category.all.order(:id)
    byebug
  end
end
