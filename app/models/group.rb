# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  group_image :string
#  introduce   :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_many :timelines
end
