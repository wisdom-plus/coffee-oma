class TagsController < ApplicationController
  include TurboStreamComponent
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
    flash.now[:notice] = t('.notice')
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream_component_replace('tag_table_form', tags: @tags, target: @target, current_user: current_user),
          turbo_stream_flash(flash)
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
    flash.now[:notice] = t('.notice')
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream_component_replace('tag_table_form', tags: @tags, target: @target, current_user: current_user),
          turbo_stream_flash(flash)
        ]
      end
      format.html { redirect_to root_path, alert: t('.alert'), status: :see_other }
    end
  end
end
