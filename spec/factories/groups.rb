# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  group_image :string
#  introduce   :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :bigint
#
FactoryBot.define do
  factory :group do
    id { 1 }
    name { 'グループ' }
    introduce { 'グループです' }
    owner_id { 1 }
  end
end
