class Badge < ApplicationRecord
  validates :name, :key, presence: true, uniqueness: true
  validates :image_url, presence: true
end
