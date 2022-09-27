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
end
