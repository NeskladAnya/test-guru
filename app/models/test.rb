class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.find_test_by_category(category)
    joins(:category)
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck('title')
  end
end
