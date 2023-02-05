# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  caption       :text(65535)
#  likes_count   :integer          default(0), not null
#  name          :string(255)
#  price         :integer
#  rate_sum      :integer          default(0), not null
#  reviews_count :integer          default(0), not null
#  shopname      :string(255)
#  url           :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_products_on_likes_count  (likes_count)
#  index_products_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Product do
  let(:user) { create(:user) }
  let(:product_build) { build(:product) }

  describe 'validate' do
    it 'product name presence' do
      product_build.name = ''
      expect(product_build.valid?).to be false
    end

    it 'product price presence' do
      product_build.price = ''
      expect(product_build.valid?).to be false
    end

    it 'product shopname presence' do
      product_build.shopname = ''
      expect(product_build.valid?).to be false
    end

    it 'product caption presence' do
      product_build.caption = ''
      expect(product_build.valid?).to be false
    end
  end

  it 'sort likes counts' do
    product1 = create(:product, likes_count: 1, user: user)
    product2 = create(:product, likes_count: 2, user: user)
    product3 = create(:product, likes_count: 10, user: user)
    expect(Product.sort_by_likes_count).to eq [product3, product2, product1]
  end

  it 'search product name for keywords' do
    product1 = create(:product, name: 'コーヒー ドリッパー', user: user)
    product2 = create(:product, name: 'コーヒー サーバー', user: user)
    product3 = create(:product, name: 'コーヒー カップ', user: user)
    expect(Product.keywords_search(name_cont: 'ドリッパー').result).to eq [product1]
    expect(Product.keywords_search(name_cont: 'コーヒー').result).to eq [product1, product2, product3]
  end
end
