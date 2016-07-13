class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.all
    @subcategories = Subcategory.all
  end
  def show
    @category = Category.find(params[:id])
    @subcategories = Subcategory.where(category: params[:id])
  end

  def destroy
  end
end
