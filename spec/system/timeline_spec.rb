require 'rails_helper'

RSpec.describe Timeline, type: :system do

  before do
    FactoryBot.create(:user, id:6, name: 'timelineuser1', email: 'timelinetest1@email.com')
    FactoryBot.create(:user, id:7, name: 'timelineuser2', email: 'timelinetest2@email.com')

    visit new_user_session_path
    fill_in 'user_email', with: 'timelinetest1@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    visit new_goal_path
    fill_in 'goal_name', with: 'タイムラインテスト用目標'
    fill_in 'goal_detail', with: 'タイムラインテスト用の目標です'
    click_on '送信'
    visit new_group_path
    fill_in 'group_name', with: 'タイムラインテスト用グループ'
    fill_in 'group_introduce', with: 'テスト用グループです'
    click_on '送信'
  end

  describe 'タイムライン投稿機能' do
    context 'タイムラインに投稿した場合' do
      it 'グループ内のタイムラインに投稿が反映されること' do
        click_on '活動を報告する'
        fill_in 'timeline_content', with: 'テスト投稿です'
        select 'タイムラインテスト用目標', from: 'timeline_goal_id'
        click_on '送信'
        expect(page).to have_content '「タイムラインテスト用目標」に関する投稿です'
      end
    end
  end

  describe 'タイムラインの投稿へのいいね機能' do
    context 'タイムラインの投稿にいいねした場合' do
      before do
        click_on '活動を報告する'
        fill_in 'timeline_content', with: 'いいね機能テストの投稿です'
        select 'タイムラインテスト用目標', from: 'timeline_goal_id'
        click_on '送信'
      end
      it '該当のタイムラインに関する目標のいいね数が１増加していること' do
        click_on 'ログアウト'
        fill_in 'user_email', with: 'timelinetest2@email.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        group = Group.find_by(name: 'タイムラインテスト用グループ')
        visit group_path(group)
        click_on 'グループに参加する'
        before_praised_goal = Goal.find_by(name: 'タイムラインテスト用目標')
        before_praised_count = before_praised_goal.praises[0].praised
        click_on "いいね！", match: :first
        after_parised_goal = Goal.find_by(name: 'タイムラインテスト用目標')
        after_praised_count = after_parised_goal.praises[0].praised
        expect(before_praised_count).to eq 0
        expect(after_praised_count).to eq 1
      end
    end
  end

end