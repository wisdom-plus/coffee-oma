# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagTableForm, type: :component do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:bean) { create(:bean, user: user) }

  it 'renders a form(product)' do
    tag = product.tag_counts_on(:tags)
    render_inline(TagTableForm::Component.new(tags: tag, target: product.decorate, current_user: nil))

    expect(page).to have_css '.tag_link'
    expect(page).to have_no_css '#accordion'
  end

  it 'renders a form(product, signed)' do
    tag = product.tag_counts_on(:tags)
    render_inline(TagTableForm::Component.new(tags: tag, target: product.decorate, current_user: user))

    expect(page).to have_css '.tag_link'
    expect(page).to have_css '#accordion'
  end

  it 'renders a form(bean)' do
    tag = bean.tag_counts_on(:tags)
    render_inline(TagTableForm::Component.new(tags: tag, target: bean.decorate, current_user: nil))

    expect(page).to have_css '.tag_link'
    expect(page).to have_no_css '#accordion'
  end

  it 'renders a form(bean , signed)' do
    tag = bean.tag_counts_on(:tags)
    render_inline(TagTableForm::Component.new(tags: tag, target: bean.decorate, current_user: user))

    expect(page).to have_css '.tag_link'
    expect(page).to have_css '#accordion'
  end
end
