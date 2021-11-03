class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_many :results
  has_many :users, through: :results
  belongs_to :author_id, class_name: 'User', foreign_key: 'author_id'

  def self.find_test_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: {title: category})
    .order(title: :desc)
    .pluck('title')
  end
end
