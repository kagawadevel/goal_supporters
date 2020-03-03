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
#
require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
