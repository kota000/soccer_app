require 'rails_helper'

RSpec.describe 'comments', type: :feature do
  describe 'comments' do
    before do
      visit root_path
      @comment = create(:comment)
    end

    context 'コメント画面表示' do
      it 'ログインをしているとき' do
        click_on 'ログイン'
        click_on 'ゲストログイン'
        expect(current_path).to eq root_path
        click_on '大分トリニータ'
        click_on 'Hello'
        expect(page).not_to have_content 'ログインをしてください'
      end

      it 'コメントが表示されているか(ログインしていないとき)' do
        click_on '大分トリニータ'
        click_on 'Hello'
        expect(page).to have_content 'Test Content'
        expect(page).to have_content @comment.user.username
        expect(page).to have_content 'ログインをしてください'
      end
    end

    context 'コメントの作成' do
      before do
        visit user_session_path
        click_on 'ゲストログイン'
        click_on '大分トリニータ'
        click_on 'Hello'
      end

      # it 'コメントを作成できるか' do
      #   fill_in 'comment[content]', with: "aaaaa"
      #   click_on 'コメントする'
      #   expect(page).to have_content "コメントを投稿しました。"
      #   within '.comment' do
      #     expect(page).to have_content "ゲストユーザー"
      #     expect(page).to have_content "aaaaa"
      #   end
      # end

      # it 'コメントの文字数が200を超える場合' do
      #   fill_in 'comment[content]', with: "a" * 201
      #   click_on 'コメントする'
      #   expect(page).not_to have_content "a" * 201, format: :js
      # end

      # it 'コメントの文字数が0の場合' do
      #   find('.save', text: 'コメントする').click
      #   expect(page).to have_content 'コメントを作成できませんでした。'
      # end
    end
  end
end
