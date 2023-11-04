class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  def index
    @articles = Article.all
  end

  def show 
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, success: 'Статья успешно создана'
    else
      render :new, danger: 'Статья не создана'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, success: 'Статья успешно обнавлена'
    else
      render :edit, danger: 'Статья не обновлена'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, success: 'Статья успешно удалена'
  end

  private 
  def article_params
    params.require(:article).permit(:title, :summary, :body)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end

end
