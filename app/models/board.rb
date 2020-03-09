# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  detail     :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#  owner_id   :bigint
#
# Indexes
#
#  index_boards_on_group_id  (group_id)
#  index_boards_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (owner_id => users.id)
#
class Board < ApplicationRecord

  has_many :comments
  belongs_to :group
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :title, presence: true, length: { maximum: 50 }
  validates :detail, presence: true, length: { maximum: 225 }

end
