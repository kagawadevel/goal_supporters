# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  introduce              :text
#  name                   :string
#  profile_image          :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, uniqueness: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  before_validation { email.downcase! }

  validates :password, length: { minimum: 6 }
  has_many :timelines, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_group_relations, dependent: :destroy
  has_many :groups, through: :user_group_relations, source: :group
  has_many :goals, dependent: :destroy
  has_many :my_groups, class_name: 'Group', foreign_key: 'owner_id'
  has_many :my_boards, class_name: 'Board', foreign_key: 'owner_id'
end
