class AdminController < ApplicationController
  def index
    @total_orders = Orders.count
  end
end
