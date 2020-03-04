# == Schema Information
#
# Table name: praises
#
#  id         :bigint           not null, primary key
#  praised    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :bigint
#
# Indexes
#
#  index_praises_on_goal_id  (goal_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#
require 'test_helper'

class PraiseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
