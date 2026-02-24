class ArticlesController < ApplicationController
  def index
  @articles = Article.all
  @article = Article.new()
  end

  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new()
  end
  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article) # Will raise ActiveModel::ForbiddenAttributesError
  end
  def destroy
  @article = Article.find(params[:id])
  @article.destroy
  # No need for app/views/restaurants/destroy.html.erb
  redirect_to articles_path, status: :see_other
end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
