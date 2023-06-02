# == Schema Information
#
# Table name: reviews
#
#  id                :bigint           not null, primary key
#  content           :text(65535)      not null
#  rate              :float(24)
#  reviewlikes_count :integer          default(0), not null
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_reviews_on_created_at  (created_at)
#  index_reviews_on_product_id  (product_id)
#  index_reviews_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe Review do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:build_review) { build(:review, user: user, product: product) }

  describe 'validation' do
    it 'is invalid with a title' do
      build_review.title = ''
      expect(build_review.valid?).to be false
    end

    it 'is invalid with a content' do
      build_review.content = ''
      expect(build_review.valid?).to be false
    end

    it 'is invalid with a rate' do
      build_review.rate = ''
      expect(build_review.valid?).to be false
    end

    it 'is invalid with a rate for 0' do
      build_review.rate = 0
      expect(build_review.valid?).to be false
    end

    it 'is invalid with a rate for 6' do
      build_review.rate = 6
      expect(build_review.valid?).to be false
    end
  end

  it 'get latest review' do
    review1 = create(:review, user: user, product: product, created_at: Time.zone.now)
    review2 = create(:review, user: user, product: product, created_at: 1.day.from_now)
    review3 = create(:review, user: user, product: product, created_at: 1.day.ago)
    expect(Review.latest_review).to eq [review2, review1, review3]
  end

  it 'get reviews associated with product' do
    product1 = create(:product, user: user, name: 'product1')
    review1 = create(:review, user: user, product: product)
    review2 = create(:review, user: user, product: product)
    create(:review, user: user, product: product1)
    expect(Review.show_review(product.id)).to eq [review1, review2]
  end

  it 'get reviews associated with user' do
    user1 = create(:user, :other_user)
    review1 = create(:review, user: user1, product: product)
    expect(Review.user_review(user1.id)).to eq [review1]
  end

  # 自分が報告したレビューは除外したレビューを取得する
  it 'get unreported reviews' do
    user1 = create(:user, :other_user)
    review1 = create(:review, user: user, product: product)
    review2 = create(:review, user: user1, product: product)
    review3 = create(:review, user: user, product: product, title: 'review3')
    create(:report, user: user, review: review1)
    create(:report, user: user1, review: review2)
    expect(Review.exclude_reviews(product.id, user.id)).to eq [review2, review3]
  end
end
