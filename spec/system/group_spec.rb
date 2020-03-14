require 'rails_helper'

RSpec.describe Group, type: :system do

  before do
    FactoryBot.create(:user, id:4)

    visit new_user_session_path
    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
  end

  describe 'グループ作成機能' do
    context 'グループを作成した場合' do
      it 'グループが登録され、グループ詳細ページに変遷すること' do
        visit new_group_path
        fill_in 'group_name', with: 'グループ作成テストグループ'
        fill_in 'group_introduce', with: 'グループ作成テストで作成したグループ'
        click_on '送信'
        expect(page).to have_content 'グループ名: グループ作成テストグループ'
      end
    end
  end

  describe 'グループ編集機能' do
    context 'グループを編集した場合' do
      it '編集内容が反映されていること' do
        visit new_group_path
        fill_in 'group_name', with: 'グループ編集テストグループ'
        fill_in 'group_introduce', with: 'グループ編集テストで作成したグループ'
        click_on '送信'
        click_on 'グループ情報を編集する'
        fill_in 'group_name', with: 'グループ編集テストで編集した後のグループ'
        fill_in 'group_introduce', with: 'グループ編集テストで編集した後のグループ'
        click_on '送信'
        expect(page).to have_content 'グループ名: グループ編集テストで編集した後のグループ'
      end
    end
  end

  describe 'グループ編集機能' do
    context 'グループを編集した場合' do
      it '編集内容が反映されていること' do
        visit new_group_path
        fill_in 'group_name', with: 'グループ編集テストグループ'
        fill_in 'group_introduce', with: 'グループ編集テストで作成したグループ'
        click_on '送信'
        click_on 'グループ情報を編集する'
        fill_in 'group_name', with: 'グループ編集テストで編集した後のグループ'
        fill_in 'group_introduce', with: 'グループ編集テストで編集した後のグループ'
        click_on '送信'
        expect(page).to have_content 'グループ名: グループ編集テストで編集した後のグループ'
      end
    end
  end

  describe 'グループ削除機能' do
    context 'グループを削除した場合' do
      it 'グループ削除が反映されていること' do
        visit new_group_path
        fill_in 'group_name', with: 'グループ削除テストグループ'
        fill_in 'group_introduce', with: 'グループ削除テストで作成したグループ'
        click_on '送信'
        click_on 'グループ情報を削除する'
        page.driver.browser.switch_to.alert.accept
        group = Group.find_by(name: 'グループ削除テストグループ')
        expect(group).to eq nil
      end
    end
  end

end