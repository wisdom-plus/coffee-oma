require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }
  let(:product_like) { create(:product_like, user: user, liked_id: product.id) }
  let(:bean_like) { create(:bean_like, user: user, liked_id: bean.id) }

  it "find product_like and bean_like" do
    product_like
    bean_like
    expect(Like.find_product_and_bean(user.id)).to eq [bean_like, product_like]
  end
end
