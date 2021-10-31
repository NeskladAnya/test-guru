class User < ApplicationRecord
  def find_test(level)
    tests = Result.where(user_id: id).map { |i| i.test_id }
    Test.where(level: level, id: tests)
  end
end
