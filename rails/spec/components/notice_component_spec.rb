# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notice::Component, type: :component do
  it 'renders the notice' do
    render_inline(described_class.new(notice: '通知'))

    expect(page).to have_text '通知'
    expect(page).to have_css '#message', text: '通知'
  end
end
