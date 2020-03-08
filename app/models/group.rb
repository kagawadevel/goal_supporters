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
#  owner_id    :bigint
#
class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  has_many :timelines
  has_many :boards
  has_many :comments
  has_many :user_group_relations, dependent: :destroy
  has_many :users, through: :user_group_relations, source: :user
  belongs_to :user, class_name: 'User', foreign_key: 'id'
end
