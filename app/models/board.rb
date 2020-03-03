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
#
# Indexes
#
#  index_boards_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Board < ApplicationRecord

  has_many :comments
  belongs_to :group

  validates :title, presence: true, length: { maximum: 50 }
  validates :detail, presence: true, length: { maximum: 225 }

end
