require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe 'posts' do
    before do
      visit root_path
    end

    context 'postの表示' do
      before do
        @post = create(:post)
      end

      it '大分トリニータのページだけ表示されているか' do
        visit root_path
        click_on '大分トリニータ'
        expect(page).to have_content 'Hello'
        visit root_path
        click_on '湘南ベルマーレ'
        expect(page).not_to have_content 'Hello'
      end
    end

    context 'postの作成' do
      before do
        @user = create(:user)
      end

      it 'ログインしているときだけpost作成フォームが表示される' do
        click_on 'Login'
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'Log in'
        click_on '川崎フロンターレ'
        click_on '新規投稿する'
        expect(page).not_to have_content 'ログインをしてください'
      end

      it 'ログインをしていないとログインボタンが表示される' do
        click_on '川崎フロンターレ'
        click_on '新規投稿する'
        expect(page).to have_content 'ログインをしてください'
      end
    end

    context 'search' do
      before do
        @post = create(:post)
      end

      it '検索した投稿だけが表示される' do
        visit posts_path
        expect(page).to have_content 'All posts'
        expect(page).to have_content '1件'
        fill_in 'search_word', with: 'aa'
        click_on 'search'
        expect(page).to have_content '0件'
        fill_in 'search_word', with: 'Hello'
        click_on 'search'
        expect(page).to have_content '1件'
      end
    end
  end
end
