require 'rails_helper'

RSpec.describe 'static_page', type: :feature do
  describe 'start page' do
    before do
      visit root_path
    end

    it 'have a title' do
      expect(page).to have_title APP_TITLE
    end

    it '表示確認' do
      expect(page).to have_content '川崎フロンターレ'
      expect(page).to have_content 'ヴィッセル神戸'
      expect(page).to have_content 'Login'
      expect(page).to have_content '大分トリニータ'
      expect(page).to have_content '湘南ベルマーレ'
    end
  end
end
