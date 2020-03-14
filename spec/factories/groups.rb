FactoryBot.define do
  factory :group do
    id { 1 }
    name { 'グループ' }
    introduce { 'グループです' }
    owner_id { 1 }
  end
end