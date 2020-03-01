class Timeline < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :content, presence: true, length: { maximum: 225 }
end
