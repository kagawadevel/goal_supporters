class Timeline < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validate :content, presence: true, length: { maximum: 225 }
end
