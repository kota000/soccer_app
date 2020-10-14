require 'rails_helper'

RSpec.describe 'questions', type: :feature do
  describe 'questions' do
    before do
      visit root_path
      click_on '予想する'
    end

    context 'ログインしている時' do
      before do
        visit user_session_path
        click_on 'ゲストログイン'
        click_on '予想する'
      end

      it '表示確認' do
        expect(page).to have_content '優勝するチームを予想しよう！'
        expect(page).to have_content '〜2020年優勝すると思うチームを選択してください。〜'
      end
    end

    context 'ログインしていない時' do
      it '表示確認' do
        expect(page).not_to have_content '〜2020年優勝すると思うチームを選択してください。〜'
      end
    end
  end
end