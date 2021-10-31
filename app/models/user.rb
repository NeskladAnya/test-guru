class User < ApplicationRecord
  def find_test(level)
    Result.joins('JOIN tests ON results.test_id = tests.id')
      .where(user_id: id, tests: {level: level})
      .pluck('tests.title')
  end
end
