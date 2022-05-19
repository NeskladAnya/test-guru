class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validates :name, :key, presence: true, uniqueness: true
  validates :image_url, presence: true
end
