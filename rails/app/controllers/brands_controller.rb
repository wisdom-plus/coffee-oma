class BrandsController < ApplicationController
  def index
    @brands = Brand.all.page(params[:page]).per(9)
  end

  def show
    @brand = Brand.find_by(id: params[:id])
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brands_path, notice: t('.notice'), status: :see_other
    else
      flash.now[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @brand = Brand.find_by(id: params[:id])
  end

  def update
    @brand = Brand.find_by(id: params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path, notice: t('.notice'), status: :see_other
    else
      flash.now[:alert] = t('.alert')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.find_by(id: params[:id])
    @brand.destroy
    redirect_to brands_path, notice: t('.notice'), status: :see_other
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :logo, :website)
  end
end
