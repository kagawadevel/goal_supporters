# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  count      :integer
#  detail     :string
#  finished   :boolean          default("false")
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
require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
