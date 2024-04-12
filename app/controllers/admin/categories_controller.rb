class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end
end
