class BeansController < ApplicationController
  def new
    @bean = Bean.new
    @roast =["焙煎度不明","生豆","ミディアム","ハイ","シティ","フルシティ","フレンチ","イタリアン"]
  end

  def create
    @bean = Bean.new(bean_params)
    if @bean.save
      flash[:success] = "登録に成功しました"
      redirect_to beans_path
    else
      flash[:error] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @bean = Bean.find(params[:id])
  end


  def index
    @beans = Bean.all
  end

  private

  def bean_params
    params.require(:bean).permit(:area, :country, :name, :purification, :roast, :url, :description)
  end
end
