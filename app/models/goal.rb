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
class Goal < ApplicationRecord

  has_many :praises, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }

  validates :detail, presence: true, length: { maximum: 225 }

end
