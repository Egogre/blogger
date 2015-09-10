class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    if @article = Article.create(article_attributes)
      redirect_to articles_path
      flash.notice = "The article '#{@article.title}' was successfully created!"
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @article.update(article_attributes)
      redirect_to article_path(@article)
      flash.notice = "The article '#{@article.title}' was successfully updated!"
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash.notice = "The article '#{@article.title}' is gone forever!"
  end

  private

    def article_attributes
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find(params[:id])
    end

end
