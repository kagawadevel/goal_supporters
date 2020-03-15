10.times do |n|
  User.create!(
      id: n + 100,
      name: "テストユーザー#{n + 100}",
      email: "test#{n + 100}@email.com",
      introduce:  "ユーザー#{n + 100}です" ,
      password:  'password',
      password_confirmation: 'password'
  )
end

10.times do |n|
  Group.create!(
      id: n + 100,
      name: "テストグループ#{n + 100}",
      introduce: "テストユーザー#{n + 100}です",
      owner_id: n + 100
  )
end

UserGroupRelation.create!(
    user_id: 100,
    group_id: 100
)

Goal.create!(
    id: 100,
    name: "ユーザー１の目標",
    detail: "ユーザー１の目標です",
    user_id: 100,
  )

Timeline.create!(
    group_id: 100,
    user_id: 100,
    goal_id: 100,
    content: "日々の報告です！"
)

Praise.create!(
    goal_id: 100,
    praised: 0
)