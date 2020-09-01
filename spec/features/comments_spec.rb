require 'rails_helper'

RSpec.describe 'comments', type: :feature do
  describe 'comments' do
    before do
      visit root_path
      @comment = create(:comment)
    end

    context 'コメント画面' do
      it 'コメントが表示されているか' do
        click_on '大分トリニータ'
        click_on 'Hello'
        expect(page).to have_content 'Test Content'
        expect(page).to have_content @comment.user.username
        expect(page).to have_content 'ログインをしてください'
        expect(page).not_to have_content 'コメントする'

      end

      it 'ログインをしているとき' do
        click_on 'Login'
        fill_in 'user[email]', with: @comment.user.email
        fill_in 'user[password]', with: "000000"
        click_on 'Log in'
        expect(current_path).to eq root_path
        click_on '大分トリニータ'
        click_on 'Hello'
        # expect(page).to have_content 'コメントする'
        expect(page).not_to have_content 'ログインをしてください'
      end
    end
  end
end
