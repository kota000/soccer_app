# require 'rails_helper'

# RSpec.describe 'questions', type: :feature do
#   describe 'questions' do
#     before do
#       visit root_path
#       click_on '予想する'
#     end

#     context 'ログインしている時' do
#       before do
#         visit user_session_path
#         click_on 'ゲストログイン'
#         click_on '予想する'
#       end

#       it '表示確認' do
#         expect(page).to have_content '優勝するチームを予想しよう！'
#         expect(page).to have_content '〜2020年優勝すると思うチームを選択してください。〜'
#       end

#       it '投票しランキングに反映され、投票ボタンが消えるか' do
#         find("option[value='浦和レッズ']").select_option
#         click_on '投票する'
#         expect(page).to have_content '投票しました。'
#         expect(page).to have_content '浦和レッズ'
#         expect(page).to have_content '総投票数:1件'
#         expect(page).not_to have_content '投票する'
#       end

#       it 'チームを選択しないと投票できない' do
#         click_on '投票する'
#         expect(page).to have_content '投票することができませんでした。'
#       end
#     end

#     context 'ログインしていない時' do
#       it '表示確認' do
#         expect(page).not_to have_content '〜2020年優勝すると思うチームを選択してください。〜'
#         expect(page).not_to have_content '投票する'
#       end
#     end
#   end
# end
