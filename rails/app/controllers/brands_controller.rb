class BrandsController < ApplicationController
  def index
    @brands = Brand.all
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
      redirect_to brands_path, notice: "Brand created successfully"
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find_by(id: params[:id])
  end

  def update
    @brand = Brand.find_by(id: params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path, notice: "Brand updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @brand = Brand.find_by(id: params[:id])
    @brand.destroy
    redirect_to brands_path, notice: "Brand deleted successfully"
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :logo, :website)
  end
end
