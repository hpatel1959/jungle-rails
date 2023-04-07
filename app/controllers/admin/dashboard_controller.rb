class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD'], only: [:show]

  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
