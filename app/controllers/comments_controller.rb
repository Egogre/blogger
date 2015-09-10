class CommentsController < ApplicationController

  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def create
    comment = Comment.new(comment_attributes)
    comment.article_id = params[:article_id]

    comment.save

    redirect_to article_path(comment.article)
  end

  private

    def comment_attributes
      params.require(:comment).permit(:author_name, :body)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

end
