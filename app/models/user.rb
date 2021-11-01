class User < ApplicationRecord
  def find_test_by_level(level)
    Test
      .joins('JOIN results on tests.id = results.test_id')
      .where(level: level, results: { user_id: id })
  end
end
