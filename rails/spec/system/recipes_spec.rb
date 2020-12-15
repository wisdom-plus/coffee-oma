require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  let(:user) { create(:user) }
  let(:user1) { create(:user, email: 'test1@example.com', username: 'test1') }
  let(:recipe) { create(:recipe, user: user) }
  let(:recipe1) { create(:recipe, status: true, powdergram: '30', user: user1) }

  describe 'new' do
    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit new_recipe_path
      end

      it 'redirect user/show(recipe)' do
        fill_in 'powdergram', with: '22'
        select '極細挽き', from: 'recipe_grinding'
        fill_in 'temperature', with: '95'
        fill_in 'recipe_time1', with: '2'
        fill_in 'recipe_time2', with: '45'
        fill_in 'amount',	with: '230'
        check '投稿をタイムラインに公開する'
        click_on '登録する'
        expect(page).to have_current_path "/users/#{user.id}/show"
      end

      it 'create recipe' do
        expect do
          fill_in 'powdergram', with: '22'
          select '極細挽き', from: 'recipe_grinding'
          fill_in 'temperature', with: '95'
          fill_in 'recipe_time1', with: '2'
          fill_in 'recipe_time2', with: '45'
          fill_in 'amount',	with: '230'
          check '投稿をタイムラインに公開する'
          click_on '登録する'
        end.to change(Recipe, :count).by 1
      end

      it 'not create recipe' do
        expect do
          fill_in 'powdergram', with: ''
          select '極細挽き', from: 'recipe_grinding'
          fill_in 'temperature', with: '95'
          fill_in 'recipe_time1', with: '2'
          fill_in 'recipe_time2', with: '45'
          fill_in 'amount',	with: '230'
          check '投稿をタイムラインに公開する'
          click_on '登録する'
        end.to change(Recipe, :count).by 0
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit new_recipe_path
        expect(page).to have_current_path new_user_session_path
      end
    end
  end

  describe 'index' do
    before do
      recipe
      recipe1
      visit recipes_path
    end

    it 'displayed recipe1' do
      link = first('a.card')
      expect(link[:href]).to eq recipe_path(recipe1.id)
    end

    it 'not displayed status false' do
      expect(page).to have_no_link recipe_path(recipe.id)
    end
  end

  describe 'show' do
    before do
      recipe
    end

    context 'when login' do
      before do
        login(user, user.email, user.password)
        visit recipe_path(recipe.id)
      end

      it 'render edit link' do
        expect(page).to have_link '内容を編集する'
      end
    end

    context 'when not login' do
      it 'not render  edit link' do
        visit recipe_path(recipe.id)
        expect(page).to have_no_link '内容を編集する'
      end
    end
  end

  describe 'edit' do
    context 'when login' do
      before do
        recipe
        login(user, user.email, user.password)
        visit edit_recipe_path(recipe.id)
      end

      it 'update recipe' do
        fill_in 'recipe_amount', with: '300'
        click_on '変更を登録する'
        expect(page).to have_selector '.spec', text: '300'
      end

      it 'not update recipe' do
        fill_in 'recipe_amount', with: ''
        click_on '変更を登録する'
        visit recipe_path(recipe.id)
        expect(page).to have_selector '.spec', text: '220'
      end
    end

    context 'when not login' do
      it 'redirect sign_in' do
        visit edit_recipe_path(recipe.id)
        expect(page).to have_current_path new_user_session_path
      end
    end
  end
end
