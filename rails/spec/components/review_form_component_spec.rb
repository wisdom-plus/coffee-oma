# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewForm, type: :component do
  let(:product) { create(:product) }

  it 'renders the review form' do
    render_inline(described_class.new(review: Review.new, product_id: product.id))

    expect(page).to have_text 'レビューの投稿'
    expect(page).to have_css '#title'
    expect(page).to have_css '#content'
  end
end
