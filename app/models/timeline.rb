# == Schema Information
#
# Table name: timelines
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :bigint
#  group_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_timelines_on_goal_id   (goal_id)
#  index_timelines_on_group_id  (group_id)
#  index_timelines_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
class Timeline < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :goal

  validates :content, presence: true, length: { maximum: 225 }
end
