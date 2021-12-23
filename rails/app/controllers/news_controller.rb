class NewsController < ApplicationController
  before_action :authenticate_admin_user!, only: %i[new create edit update destroy]
  before_action :active?, only: %i[show]
  before_action :find_news, only: %i[edit update destroy]

  def index
    @news_all = News.all
  end

  def new
    @news = News.new
  end

  def create
    @news = current_admin_user.news.create(news_params)
    if @news.save
      redirect_to root_path, notice: '登録が完了しました。'
    else
      flash[:alert] = '登録に失敗しました。'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @news.update(news_params)
      redirect_to root_path, notice: '更新が成功しました。'
    else
      render :edit
    end
  end

  def destroy
    if @news.destroy
      redirect_to root_path, notice: '削除に成功しました。'
    else
      redirect_to root_path, alert: '削除に失敗しました。'
    end
  end

  private

    def news_params
      params.require(:news).permit(:title, :content, :active, :publicshed_at)
    end

    def active?
      @news = News.find_by(id: params[:id])
      if @news.publicshed?
        @news.activate unless @news.active
      else
        redirect_to root_path, alert: '公開させておりません。'
      end
    end

    def find_news
      @news = News.find_by(id: params[:id])
    end
end
