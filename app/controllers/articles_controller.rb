class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    if Article.create(article_attributes)
      redirect_to articles_path
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @article.update(article_attributes)
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_attributes
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find(params[:id])
    end

end
