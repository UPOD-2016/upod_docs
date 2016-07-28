class ArticleDiagramBlocksController < ApplicationController
  before_action :set_article_diagram_block, only: [:show, :edit, :update, :destroy]


  #Renders a diagram or html which is used in a sandboxed iframe when rendering this block's partial in an article
  def show
	 render layout: false #don't add default layouts
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_diagram_block
      @article = ArticleDiagramBlock.find(params[:id])
    end
end
