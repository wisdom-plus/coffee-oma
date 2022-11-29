# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Alert::Component, type: :component do
  it 'renders the alert' do
    render_inline(described_class.new(alert: 'アラート'))

    expect(page).to have_text 'アラート'
    expect(page).to have_css '#message', text: 'アラート'
  end
end
