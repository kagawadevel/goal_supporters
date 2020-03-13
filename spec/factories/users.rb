FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'ユーザー' }
    email { 'test@email.com' }
    introduce { 'ユーザーです' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end