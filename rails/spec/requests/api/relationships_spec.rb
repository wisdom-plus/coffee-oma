require 'rails_helper'

RSpec.describe 'Api::Relationships' do
  let(:user) { create(:user) }
  let(:other_user) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: other_user) }
  let(:headers) { api_sign_in(user) }

  describe 'POST /api/v1/relationships' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        post api_v1_relationships_path, params: { relationships: { follow_id: other_user.id } }, headers: headers
        expect(response).to have_http_status(:created)
      end

      it 'データが作成される' do
        expect do
          post api_v1_relationships_path, params: { relationships: { follow_id: other_user.id } }, headers: headers
        end.to change(Relationship, :count).by 1
      end

      it 'レスポンス失敗(同じユーザー)' do
        post api_v1_relationships_path, params: { relationships: { follow_id: user.id } }, headers: headers
        expect(response).to have_http_status(:bad_request)
      end

      it 'レスポンス失敗(idが存在しない)' do
        post api_v1_relationships_path, params: { relationships: { follow_id: 0 } }, headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス失敗' do
        post api_v1_relationships_path, params: { relationships: { follow_id: other_user.id } }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /api/v1/relationships' do
    context 'ログインしている場合' do
      it 'レスポンス成功' do
        delete api_v1_relationship_path(follow.follow_id), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'データが削除される' do
        follow
        expect do
          delete api_v1_relationship_path(follow.follow_id), headers: headers
        end.to change(Relationship, :count).by(-1)
      end

      it 'レスポンス失敗(同じユーザー)' do
        delete api_v1_relationship_path(user.id), headers: headers
        expect(response).to have_http_status(:bad_request)
      end

      it 'レスポンス失敗' do
        delete api_v1_relationship_path(0), headers: headers
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET /api/v1/relationships/exists' do
    context 'ログインしている場合' do
      it 'レスポンス成功(フォローが存在する時)' do
        get exists_api_v1_relationships_path(follow_id: other_user.id), headers: headers
        expect(response).to have_http_status(:ok)
      end

      it 'レスポンス成功(フォローが存在しない時)' do
        get exists_api_v1_relationships_path(follow_id: other_user.id), headers: headers
        expect(response).to have_http_status(:ok)
        expect(json['follow']).to eq(expect_json(false))
      end

      it 'レスポンス失敗' do
        get exists_api_v1_relationships_path(follow_id: 0)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'ログインしていない場合' do
      it 'レスポンス成功(フォローが存在する時)' do
        follow
        get exists_api_v1_relationships_path(follow_id: other_user.id)
        expect(response).to have_http_status(:ok)
        expect(json['follow']).to eq(expect_json(false))
      end

      it 'レスポンス成功(フォローがない)' do
        get exists_api_v1_relationships_path(follow_id: other_user.id)
        expect(response).to have_http_status(:ok)
        expect(json['follow']).to eq(expect_json(false))
      end

      it 'レスポンス失敗' do
        get exists_api_v1_relationships_path(follow_id: 0)
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
