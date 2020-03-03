# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  group_id   :bigint
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#  index_comments_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (group_id => groups.id)
#
class Comment < ApplicationRecord
  belongs_to :group
  belongs_to :board
end
