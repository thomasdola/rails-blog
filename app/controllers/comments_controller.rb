class CommentsController < ApplicationController
    def create
        render plain: params[:article_id].inspect
        # @article = get_article
        # @comment = @article.comments.create comment_params
        # redirect_to @article
    end

    private
        def get_article
            id = params[:article_id]
            get_article_by_id id
        end
        def get_article_by_id id
            Article.find id
        end
        def comment_params
            params.require(:comment)
                .permit(:commenter, :body)
        end
end
