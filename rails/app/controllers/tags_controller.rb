class TagsController < ApplicationController
  before_action :authenticate_user!

  def create
    case params[:type]
    when 'Product'
      @target = Product.find(params[:id]).decorate
    when 'Bean'
      @target = Bean.find(params[:id]).decorate
    end

    @target.tag_list = params[:tag_list].split(',')
    @target.save
    @tags = @target.tag_counts_on(:tags)
    flash.now[:notice] = 'タグを更新しました。'
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            'tag_table_form',
            TagForm::Component.new(tags: @tags, target: @target, current_user: current_user).render_in(view_context)
          ),
          turbo_stream.replace(
            'flash',
            Flash::Component.new(flash: flash).render_in(view_context)
          )
        ]
      end
      format.html { redirect_to root_path, alert: t('.alert'), status: :see_other }
    end
  end

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
    flash.now[:notice] = 'タグを更新しました。'
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            'tag_table_form',
            TagForm::Component.new(tags: @tags, target: @target, current_user: current_user).render_in(view_context)
          ),
          turbo_stream.replace(
            'flash',
            Flash::Component.new(flash: flash).render_in(view_context)
          )
        ]
      end
      format.html { redirect_to root_path, alert: t('.alert'), status: :see_other }
    end
  end
end
