class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true }
  validates :level, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, case_sensitive: false }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  scope :find_test_by_category, -> (category) {
    joins(:category)
    .where(categories: {title: category})
  }

  def self.find_test_title_by_category(category)
    find_test_by_category(category).pluck('title')
  end

  def all_correct_answers
    self.questions.map do |question|
      question.answers.correct_answers.count
    end
  end
end
