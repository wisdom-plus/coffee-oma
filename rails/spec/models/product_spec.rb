require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { create(:user) }
  let(:product_build) { build(:product, user: user)}

  describe "validate" do
    it 'product name presence' do
      product_build.name = ''
      expect(product_build.valid?).to eq false
    end

    it "product price presence" do
      product_build.price = ""
      expect(product_build.valid?).to eq false
    end

    it "product shopname presence" do
      product_build.shopname = ""
      expect(product_build.valid?).to eq false
    end

    it "product caption presence" do
      product_build.caption = ""
      expect(product_build.valid?).to eq false
    end
  end

  it "sort likes counts" do
    product1 = create(:product, likes_count: 1, user: user)
    product2 = create(:product, likes_count: 2, user: user)
    product3 = create(:product, likes_count: 10, user: user)
    expect(Product.sort_by_likes_count).to eq [product3, product2, product1]
  end

  it "search product name for keywords" do
    product1 = create(:product, name: "コーヒー ドリッパー", user: user)
    product2 = create(:product, name: "コーヒー サーバー", user: user)
    product3 = create(:product, name: "コーヒー カップ", user: user)
    expect(Product.keywords_search(name_cont: "ドリッパー").result).to eq [product1]
    expect(Product.keywords_search(name_cont: "コーヒー").result).to eq [product1, product2, product3]
  end
end
