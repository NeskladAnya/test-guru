class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true }
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, case_sensitive: false }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  scope :find_test_title_by_category, -> (category) {
    joins(:category)
    .where(categories: {title: category})
    .pluck('title')
  }
end
