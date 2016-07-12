class SubcategoriesController < ApplicationController
  def show
    @subcategory = Subcategory.find(params[:id])
    @articles = Article.where(id: Categorization.select(:article_id).where(subcategory_id: params[:id]))
  end
end
