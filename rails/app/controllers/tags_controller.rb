class TagsController < ApplicationController
  before_action :authenticate_user!

  def update
    case params[:type]
    when 'Product'
      @target = Product.find(params[:id]).decorate
    when 'Bean'
      @target = Bean.find(params[:id]).decorate
    end

    @target.tag_list = params[:tag_list].split(',')
    @target.save
    @tags = @target.tag_counts_on(:tags)
    @notice = 'タグを更新しました。'
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, alert: t('.alert') }
    end
  end
end
