# == Schema Information
#
# Table name: bean_reviews
#
#  id                :bigint           not null, primary key
#  acidity           :integer
#  bitter            :integer
#  content           :text(65535)      not null
#  flavor            :integer
#  reviewlikes_count :integer          default(0), not null
#  rich              :integer
#  sweet             :integer
#  title             :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  bean_id           :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_bean_reviews_on_bean_id     (bean_id)
#  index_bean_reviews_on_created_at  (created_at)
#  index_bean_reviews_on_user_id     (user_id)
#
require 'rails_helper'

RSpec.describe BeanReview do
  let(:user) { create(:user) }
  let(:bean) { create(:bean, user: user) }
  let(:bean_review) { create(:bean_review, user: user, bean: bean) }
  let(:build_review) { build(:bean_review, user: user) }

  describe 'validation' do
    context 'valid' do
      it 'is valid with a rates for 1' do
        BeanReview::RATES.each do |rate|
          build_review.send("#{rate}=", 1)
          expect(build_review.valid?).to be true
        end
      end

      it 'is valid with a rates for 5' do
        BeanReview::RATES.each do |rate|
          build_review.send("#{rate}=", 5)
          expect(build_review.valid?).to be true
        end
      end
    end

    context 'invalid' do
      it 'is invalid with a title' do
        build_review.title = ''
        expect(build_review.valid?).to be false
      end

      it 'is invalid with a content' do
        build_review.content = ''
        expect(build_review.valid?).to be false
      end

      it 'is invalid with a rates' do
        BeanReview::RATES.each do |rate|
          build_review.send("#{rate}=", '')
          expect(build_review.valid?).to be false
        end
      end

      it 'is invalid with a rates for 0' do
        BeanReview::RATES.each do |rate|
          build_review.send("#{rate}=", 0)
          expect(build_review.valid?).to be false
        end
      end

      it 'is invalid with a rates for 6' do
        BeanReview::RATES.each do |rate|
          build_review.send("#{rate}=", 6)
          expect(build_review.valid?).to be false
        end
      end
    end
  end

  it 'get show reviews' do
    bean1 = create(:bean, user: user, name: 'bean1')
    review1 = create(:bean_review, user: user, bean: bean)
    create(:bean_review, user: user, bean: bean1, title: 'review2')
    expect(BeanReview.show_review(bean.id)).to eq [review1]
  end

  it 'get unreported reviews' do
    user1 = create(:user, :other_user)
    review1 = create(:bean_review, user: user, bean: bean)
    review2 = create(:bean_review, user: user1, bean: bean)
    review3 = create(:bean_review, user: user, bean: bean, title: 'review3')
    create(:report, user: user, review: review1)
    create(:report, user: user1, review: review2)
    expect(BeanReview.exclude_reviews(bean.id, user.id)).to eq [review2, review3]
  end

  it 'get rates average' do
    create(:bean_review, user: user, bean: bean, acidity: 1, bitter: 2, sweet: 3, rich: 4, flavor: 5)
    create(:bean_review, user: user, bean: bean, acidity: 2, bitter: 2, sweet: 2, rich: 2, flavor: 2)
    expect(BeanReview.evaluations).to eq ['1.5', '2.0', '2.5', '3.0', '3.5']
  end
end
