# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sidebar, type: :component do
  let(:user) { create(:user) }

  it 'render the sidebar(not login)' do
    render_inline(described_class.new(current_user: nil))

    expect(page).to have_text 'ログイン'
  end

  it 'render the sidebar(login)' do
    sign_in(user)
    render_inline(described_class.new(current_user: user))

    expect(page).to have_text 'ログアウト'
  end
end
