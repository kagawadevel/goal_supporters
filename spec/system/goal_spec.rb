require 'rails_helper'

RSpec.describe Goal, type: :system do

  before do
    FactoryBot.create(:user, id:5, email: 'goaltest@email.com')

    visit new_user_session_path
    fill_in 'user_email', with: 'goaltest@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
  end

  describe '目標作成機能' do
    context '目標を作成した場合' do
      it '目標が登録され、目標詳細ページに変遷すること' do
        visit new_goal_path
        fill_in 'goal_name', with: '目標です'
        fill_in 'goal_detail', with: '目標の詳細です'
        click_on '送信'
        expect(page).to have_content '目標名: 目標です'
      end
    end
  end

  describe '目標編集機能' do
    context '目標を編集した場合' do
      it '目標が編集され、内容が反映されていること' do
        visit new_goal_path
        fill_in 'goal_name', with: '編集用の目標です'
        fill_in 'goal_detail', with: '編集用の目標の詳細です'
        click_on '送信'
        click_on '目標情報を編集する'
        fill_in 'goal_name', with: '編集後の目標です'
        fill_in 'goal_detail', with: '編集後の目標の詳細です'
        click_on '送信'
        expect(page).to have_content '目標名: 編集後の目標です'
      end
    end
  end

  describe '目標削除機能' do
    context '目標を削除した場合' do
      it '目標削除が反映されていること' do
        visit new_goal_path
        fill_in 'goal_name', with: '削除用の目標です'
        fill_in 'goal_detail', with: '削除用の目標の詳細です'
        click_on '送信'
        click_on "目標情報を削除する"
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_content '削除用の目標です'
      end
    end
  end

  describe '目標達成機能' do
    context '目標達成ボタンを押した場合' do
      it '目標を達成しました！と表示され、finishedカラムがtureになること' do
        visit new_goal_path
        fill_in 'goal_name', with: '目標達成テスト'
        fill_in 'goal_detail', with: '目標達成テスト用'
        click_on '送信'
        not_finished_goal = Goal.find_by(name: '目標達成テスト')
        click_on '目標を達成済みにする'
        finished_goal = Goal.find_by(name: '目標達成テスト')
        expect(not_finished_goal.finished).to eq false
        expect(finished_goal.finished).to eq true
        expect(page).to have_content '目標を達成しました！'
      end
    end
  end

end