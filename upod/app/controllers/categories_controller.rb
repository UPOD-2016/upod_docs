class CategoriesController < ApplicationController
  def new
  end

  def index
    @categories = Category.all
    @subcategories = Subcategory.all
  end
  def show
    @category = Category.find(params[:id])
    @subcategories = Subcategory.all
  end

  def destroy
  end
end
