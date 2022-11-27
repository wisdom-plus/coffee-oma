# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewForm::Component, type: :component do
  let(:product) { create(:product) }
  let(:user) { create(:user) }

  it 'renders the review form' do
    render_inline(described_class.new(review: Review.new, product_id: product.id, current_user: user))

    expect(page).to have_text 'レビューの投稿'
    expect(page).to have_css '#title'
    expect(page).to have_css '#content'
  end
end
