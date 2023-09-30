# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReportModal, type: :component do
  it 'renders the component' do
    render_inline(described_class.new)

    expect(page).to have_css '#report-modal-link'
    expect(page).to have_text '本当によろしいですか？'
  end
end
