# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  icon                   :string(255)
#  profile                :text(65535)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  tokens                 :text(65535)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  let(:user_build) { build(:user) }
  let(:user) { create(:user) }

  it 'validate username' do
    user_build.username = ''
    expect(user_build.valid?).to be false
  end

  it 'following user' do
    other_user = create(:user, :other_user)
    create(:relationship, user: user, follow: other_user)
    expect(user.following?(other_user)).to be true
    expect(other_user.following?(user)).to be false
  end

  it 'find user' do
    expect(User.find_user(user.id)).to eq user
  end

  it 'create guest user' do
    guest = User.guest
    expect(guest.email).to eq 'guest@example.com'
    expect(guest.username).to eq 'ゲストユーザー'
  end

  describe 'where review likes' do
    let(:product) { create(:product, user: user) }
    let(:bean) { create(:bean, user: user) }
    let(:review) { create(:review, product: product, user: user) }
    let(:bean_review) { create(:bean_review, bean: bean, user: user) }

    it 'review' do
      like = ProductReviewLike.create(user: user, liked_id: review.id)
      expect(user.where_review_likes([review], 'review')).to eq [like]
    end

    it 'bean_review' do
      like = BeanReviewLike.create(user: user, liked_id: bean_review.id)
      expect(user.where_review_likes([bean_review], 'bean_review')).to eq [like]
    end

    it 'other' do
      ProductReviewLike.create(user: user, liked_id: review.id)
      expect(user.where_review_likes([review], 'other')).to eq []
    end
  end

  describe 'create_or_update_history' do
    let(:product) { create(:product, user: user) }
    let(:bean) { create(:bean, user: user) }
    let(:history) { create(:history, user: user, product: product, updated_at: 1.hour.ago) }

    it 'create products history' do
      expect do
        user.create_or_update_history(controller: 'products', id: product.id)
      end.to change(History, :count).by(1)
    end

    it 'create beans history' do
      expect do
        user.create_or_update_history(controller: 'beans', id: bean.id)
      end.to change(History, :count).by(1)
    end

    it 'update products history' do
      history
      new_history = user.create_or_update_history(controller: 'products', id: product.id)
      expect(new_history.updated_at).to be > history.updated_at
    end

    it "don't create history and return nil" do
      expect(user.create_or_update_history(controller: 'other', id: product.id)).to be_nil
    end
  end
end
