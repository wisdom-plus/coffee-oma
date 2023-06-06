require 'rails_helper'

RSpec.describe 'Brands', type: :request do
  let(:brand) { create(:brand) }
  let(:brand_params) { attributes_for(:brand) }

  describe 'GET /index' do
    it 'returns http success' do
      get brands_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get brand_path(brand.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post brands_path, params: { brand: brand_params }
      expect(response).to have_http_status(:see_other)
    end

    it 'request failed' do
      post brands_path, params: { brand: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'created brand' do
      expect do
        post brands_path, params: { brand: brand_params }
      end.to change(Brand, :count).by 1
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_brand_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get edit_brand_path(brand)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      brand_params[:name] = 'New Brand Name'
      patch brand_path(brand), params: { brand: brand_params }
      expect(response).to have_http_status(:see_other)
    end

    it 'request failed' do
      patch brand_path(brand), params: { brand: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete brand_path(brand)
      expect(response).to have_http_status(:see_other)
    end
  end
end
