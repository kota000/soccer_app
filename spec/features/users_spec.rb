require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'users' do
    before do
      visit root_path
    end

    context 'userを作成する' do
      it 'home画面からuserを作成する' do
        expect(User.count).to eq 0
        click_on 'Login'
        click_on 'Sign up'
        fill_in 'user[username]', with: 'test'
        fill_in 'user[email]', with: 'a@example.com'
        fill_in 'user[password]', with: 'aaaaaa'
        click_on 'Sign up'
        expect(current_path).to eq root_path
        expect(page).not_to have_content 'Login'
        expect(User.count).to eq 1
      end
    end

    context 'ログインをしたあとのUser機能' do
      before do
        @user = create(:user)
        click_on 'Login'
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'Log in'
      end

      it 'ログアウトする' do
        expect(page).to have_content @user.username
        click_on 'Logout'
        expect(page).not_to have_content @user.username
      end

      it '名前を編集する' do
        expect(page).to have_content 'test_user'
        click_on 'Edit'
        fill_in 'user[username]', with: 'hoge'
        click_on 'Update'
        expect(current_path).to eq root_path
        expect(page).to have_content 'アカウント情報を変更しました。'
        expect(page).to have_content 'hoge'
      end

      it 'アカウントを削除する' do
        expect(User.count).to eq 1
        click_on 'Edit'
        click_on 'Cancel my account'
        expect(User.count).to eq 0
        expect(current_path).to eq root_path
        expect(page).to have_content 'Login'
      end
    end

    context '管理者アカウントではないとできない' do
      before do
        @user = create(:user)
        click_on 'Login'
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'Log in'
      end

      it 'user一覧・詳細ページは開けない' do
        visit users_path
        expect(current_path).to eq root_path
        visit users_path
        expect(current_path).to eq root_path
      end
    end
  end
end
