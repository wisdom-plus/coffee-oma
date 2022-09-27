require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_build) { build(:user) }
  let(:user) { create(:user)}

  it "validate username" do
    user_build.username = ""
    expect(user_build.valid?).to eq false
  end

  it "following user" do
    other_user = create(:user, :other_user)
    follow = create(:relationship, user: user, follow: other_user)
    expect(user.following?(other_user)).to eq true
    expect(other_user.following?(user)).to eq false
  end

  it "find user" do
    expect(User.find_user(user.id)).to eq user
  end

  it "create guest user" do
    guest = User.guest
    expect(guest.email).to eq 'guest@example.com'
    expect(guest.username).to eq 'ゲストユーザー'
  end

  describe 'where review likes' do
    let(:product) { create(:product,user: user) }
    let(:bean) { create(:bean,user: user) }
    let(:review) { create(:review, product: product,user: user) }
    let(:bean_review) { create(:bean_review, bean: bean,user: user) }

    it 'review' do
      like = ProductReviewLike.create(user: user, liked_id: review.id)
      expect(user.where_review_likes([review], 'review')).to eq [like]
    end

    it 'bean_review' do
      like = BeanReviewLike.create(user: user, liked_id: bean_review.id)
      expect(user.where_review_likes([bean_review], 'bean_review')).to eq [like]
    end

    it "other" do
      like = ProductReviewLike.create(user: user, liked_id: review.id)
      expect(user.where_review_likes([review], 'other')).to eq []
    end
  end

  describe "create_or_update_history" do
    let(:product) { create(:product,user: user) }
    let(:bean) { create(:bean,user: user) }
    let(:history) { create(:history, user: user, product: product,updated_at: Time.zone.now - 1.hour) }

    it "create products history" do
      expect do
        user.create_or_update_history(controller: 'products', id: product.id)
      end.to change(History, :count).by(1)
    end

    it "create beans history" do
      expect do
        user.create_or_update_history(controller: 'beans', id: bean.id)
      end.to change(History, :count).by(1)
    end

    it "update products history" do
      history
      new_history = user.create_or_update_history(controller: 'products', id: product.id)
      expect(new_history.updated_at).to be > history.updated_at
    end
  end
end
