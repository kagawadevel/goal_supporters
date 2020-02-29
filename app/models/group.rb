class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
end
