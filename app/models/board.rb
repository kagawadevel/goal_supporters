class Board < ApplicationRecord
  belongs_to :group

  validates :title, presence: true, length: { maximum: 50 }
  validates :detail, presence: true, length: { maximum: 225 }

end
