class Goal < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  validates :detail, presence: true, length: { maximum: 225 }

end
