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

      it 'ログインしているときだけpost作成フォームが表示される' do
        visit user_session_path
        click_on 'ゲストログイン'
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

    context 'postの作成' do
      before do
        visit user_session_path
        click_on 'ゲストログイン'
      end

      it 'postを作成できるか' do
        click_on '湘南ベルマーレ'
        click_on '新規投稿する'
        fill_in 'post[content]', with: 'test'
        click_on '投稿する'
        expect(page).to have_content '投稿を作成しました!'
        within '.cards' do
          expect(page).to have_content 'test'
        end
      end

      it 'postの文字数が50の場合' do
        click_on '浦和レッズ'
        click_on '新規投稿する'
        fill_in 'post[content]', with: 'a' * 50
        click_on '投稿する'
        expect(page).to have_content '投稿することができませんでした。'
      end

      it 'postの文字数が0の場合' do
        click_on '浦和レッズ'
        click_on '新規投稿する'
        fill_in 'post[content]', with: ''
        click_on '投稿する'
        expect(page).to have_content '投稿することができませんでした。'
      end
    end

    context 'postの削除' do
      before do
        @post = create(:post)
      end

      it '自分が作成したpostのみ削除できる' do
        click_on 'ログイン'
        fill_in 'user[email]', with: @post.user.email
        fill_in 'user[password]', with: @post.user.password
        click_on 'Log in'
        click_on '大分トリニータ'
        click_on 'Hello'
        click_on '掲示板を削除する'
        expect(page).to have_content '投稿を削除しました'
      end

      it '自分以外が作成したpostは削除できない' do
        visit user_session_path
        click_on 'ゲストログイン'
        click_on '大分トリニータ'
        click_on 'Hello'
        expect(page).not_to have_content '掲示板を削除する'
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
