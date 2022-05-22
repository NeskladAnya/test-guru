class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = []
  end

  def assign_badges
    find_badges

    unless @badges.empty?
      @user.badges.push(@badges)
    end
  end

  private
  def find_badges
    if @test_passage.success?
      one_category_tests_passed
      one_level_tests_passed
      test_passed_at_first_attempt
    end
  end

  def test_passed_at_first_attempt
    badge = Badge.find_by(key: 'at_1_attempt')

    if @user.test_passages.where(test_id: @test.id).count == 1
      @badges.push(badge)
    end
  end

  def one_category_tests_passed
    category = @test.category
    badge = Badge.find_by(key: category.title.downcase)

    all_tests_count = Test.where(category_id: category.id).count
    count = 0

    if badge.present?
      for test_passage in @user.test_passages
        if test_passage.success? && test_passage.test.category_id == category.id
          count += 1
        end
      end

      if count >= all_tests_count
        @badges.push(badge)
      end
    end
  end

  def one_level_tests_passed
    level = @test.level
    badge = Badge.find_by(key: level.to_s + '_level')

    all_tests_count = Test.where(level: level).count
    count = 0

    if badge.present?
      for test_passage in @user.test_passages
        if test_passage.success? && test_passage.test.level == level
          count += 1
        end
      end

      if count >= all_tests_count
        @badges.push(badge)
      end
    end
  end
end
