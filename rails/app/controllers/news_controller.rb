class NewsController < ApplicationController
  before_action :authenticate_admin_user!, only: %i[new create edit update destroy]

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

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to root_path, notice: '更新が成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      redirect_to root_path, notice: '削除に成功しました。'
    else
      redirect_to root_path, alert: '削除に失敗しました。'
    end
  end

  private

    def news_params
      params.require(:news).permit(:content, :active, :publicshed_at)
    end
end
