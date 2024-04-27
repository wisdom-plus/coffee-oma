require 'rails_helper'

RSpec.describe Like do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:review) { create(:review, user: user, product: product) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:product_review_like) { create(:product_review_like, user: user, liked_id: review.id) }
  let(:bean_review_like) { create(:bean_review_like, user: user, liked_id: bean_review.id) }

  it 'get review_likes accosiated a review' do
    product_review_like
    bean_review_like
    review2 = create(:review, user: user, product: product, title: 'review2')
    bean_review2 = create(:bean_review, user: user, bean: bean, title: 'bean_review2')
    create(:product_review_like, user: user, liked_id: review2.id)
    create(:bean_review_like, user: user, liked_id: bean_review2.id)

    aggregate_failures do
      expect(ProductReviewLike.select_id(review.id)).to eq product_review_like
      expect(BeanReviewLike.select_id(bean_review.id)).to eq bean_review_like
    end
  end

  describe '#liked' do
    it 'bean_review_like' do
      expect(bean_review_like.liked).to eq bean_review
    end

    it 'product_review_like' do
      expect(product_review_like.liked).to eq review
    end
  end
end
