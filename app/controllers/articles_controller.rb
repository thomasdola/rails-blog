class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def create
        data = article_params
        @article = Article.new data
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def show
        @article = get_article_by_id
    end

    def index
        @articles = Article.all
    end

    def edit
        @article = get_article_by_id
    end

    def update
        @article = get_article_by_id
        data = article_params
        if @article.update data
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article = get_article_by_id
        @article.destroy
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end
        def get_article_by_id
            id = params[:id]
            @article = Article.find id
        end
end
