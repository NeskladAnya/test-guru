class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :results
  has_many :tests, through: :results

  def find_test_by_level(level)
    Test
      .joins('JOIN results on tests.id = results.test_id')
      .where(level: level, results: { user_id: id })
  end
end
