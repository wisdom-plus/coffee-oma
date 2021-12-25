class TagsController < ApplicationController
  before_action :authenticate_user!

  def update
    case params[:type]
    when 'Product'
      @target = Product.find(params[:id])
    when 'Bean'
      @target = Bean.find(params[:id])
    end

    @target.tag_list = params[:tag_list].split(',')
    @target.save
    @tags = @target.tag_counts_on(:tags)
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, alert: '登録に失敗しました。' }
    end
  end
end
