# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  detail     :string
#  finished   :boolean          default("false")
#  informed   :integer          default("0")
#  name       :string
#  past       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_goals_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :goal do
    id { 1 }
    name { '目標です' }
    detail { '目標の詳細です' }
  end
end
