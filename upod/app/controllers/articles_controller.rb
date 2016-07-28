class ArticlesController < ApplicationController
    #include check_user
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index,:show]
    # GET /articles
    def index
        Article.reindex

        search_options = {
            fields: ["name^10","title^5","body^5","label^1"],
            match: :word_start,
            suggest: true,
            misspellings: {below: 2},
            order: {_score: :desc}
            #where: {name: params[:filter].present? ? params[:filter] : "*"}
        }

        if params[:filter].present?
          search_options[:where] = {name: params[:filter]}
        end

        if params[:q].present?
            @articles = Article.search params[:q], search_options
            @suggestion = @articles.suggestions
        else
            @articles = Article.all
            @suggestion = []
    end

    end

    # GET /articles/1
    def show
        @article = Article.find(params[:id])
    end

    # GET /articles/new
    def new
        @article = Article.new
        @test = "hello"
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
        @article = Article.create_from_sir_trevor(params[:sir_trevor_content])
        redirect_to @article
    end

    # PATCH/PUT /articles/1
    def update
        if @article.update(article_params)
            redirect_to @article, notice: 'Article was successfully updated.'
        else
            render :edit
        end
    end

    # DELETE /articles/1
        def destroy
            @article.destroy
        redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
        @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
        params[:article]
    end
end
