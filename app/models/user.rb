class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, :name, presence: true

  def find_test_by_level(level)
    tests.where(level: level)
  end
end
