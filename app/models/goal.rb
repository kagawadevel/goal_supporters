# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  count      :integer
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
class Goal < ApplicationRecord

  has_many :praises, dependent: :destroy
  has_many :timelines, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }

  validates :detail, presence: true, length: { maximum: 225 }

end
