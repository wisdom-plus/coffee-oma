require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:recipe_params) { attributes_for(:recipe) }

  describe 'GET /recipes' do
    it 'request success' do
      get recipes_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /recipe/new' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        get new_recipe_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not login' do
      it 'request fail' do
        get new_recipe_path
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST /recipes' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        post recipes_path, params: { recipe: recipe_params }
        expect(response).to have_http_status(:found)
      end

      it 'created recipe' do
        expect do
          post recipes_path, params: { recipe: recipe_params }
        end.to change(Recipe, :count).by 1
      end
    end

    context 'when not login' do
      it 'request fail' do
        post recipes_path, params: { recipe: recipe_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET /recipe/:id' do
    it 'request success' do
      get recipe_path(recipe.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /recipe/:id/edit' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        get edit_recipe_path(recipe.id)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when not login' do
      it 'request fail' do
        get edit_recipe_path(recipe.id)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH /recipe/:id' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
      end

      it 'request success' do
        patch recipe_path(recipe.id), params: { recipe: recipe_params }
        expect(response).to have_http_status(:found)
      end
    end

    context 'when not login' do
      it 'request fail' do
        patch recipe_path(recipe.id), params: { recipe: recipe_params }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE /recipes/:id' do
    context 'when login' do
      before do
        user.confirm
        sign_in user
        recipe
      end

      it 'request success' do
        delete recipe_path(recipe.id)
        expect(response).to have_http_status(:found)
      end

      it 'destroy recipe' do
        expect do
          delete recipe_path(recipe.id)
        end.to change(Recipe, :count).by(-1)
      end
    end

    context 'when not login ' do
      it 'request fail' do
        delete recipe_path(recipe.id)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
