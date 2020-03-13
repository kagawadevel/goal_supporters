require 'rails_helper'

RSpec.describe User, type: :system do

  before do
  end

  describe 'サインアップ機能' do
    context 'サインアップした場合' do
      it 'ユーザーが登録されること' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'サインアップテストユーザー'
        fill_in 'user_email', with: 'signupuser@email.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_on 'サインアップ'
        click_on 'マイページ'
        expect(page).to have_content 'サインアップテストユーザー'
      end
    end
  end

  describe 'ログイン機能' do
    context 'ログインした場合' do
      before do
        FactoryBot.create(:user, id: 2, email: 'loginuser@email.com')
      end
      it 'ログインしました。と表示されログインできること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'loginuser@email.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
  end

  describe 'ログアウト機能' do
    context 'ログアウトした場合' do
      before do
        FactoryBot.create(:user, id: 3, email: 'logoutuser@email.com')
      end
      it 'ログアウト後、ログイン画面へ変遷すること' do
        visit new_user_session_path
        fill_in 'user_email', with: 'logoutuser@email.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_on 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
  end


end