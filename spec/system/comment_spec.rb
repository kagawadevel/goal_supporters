require 'rails_helper'

RSpec.describe Comment, type: :system do

  before do
    FactoryBot.create(:user, id:8, name: 'commentuser1', email: 'commentuser1@email.com')

    visit new_user_session_path
    fill_in 'user_email', with: 'commentuser1@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    visit new_group_path
    fill_in 'group_name', with: 'コメントテスト用グループ'
    fill_in 'group_introduce', with: 'コメント用グループです'
    click_on '送信'
  end

  describe '掲示板作成機能' do
    context '掲示板を作成した場合' do
      it '作成内容が反映されること' do
        click_on '掲示板を新しく作成する'
        fill_in 'board_title', with: 'テスト用掲示板'
        fill_in 'board_detail', with: 'テスト用掲示板の詳細'
        click_on '送信'
        expect(page).to have_content 'テスト用掲示板'
      end
    end
  end

  describe 'コメント投稿機能' do
    context 'コメントを投稿した場合' do
      it '投稿内容が反映されること' do
        click_on '掲示板を新しく作成する'
        fill_in 'board_title', with: 'コメントテスト用掲示板'
        fill_in 'board_detail', with: 'コメント用掲示板の詳細'
        click_on '送信'
        click_on '掲示板を確認'
        fill_in 'comment_content', with: 'コメントテスト用のコメント'
        click_on 'コメントを投稿'
        expect(page).to have_content 'コメントテスト用のコメント'
      end
    end
  end

end