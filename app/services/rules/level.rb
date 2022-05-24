module Rules
  class Level < AbstractRuleSpecification
    def satisfies?
      user = @test_passage.user

      test_count = Test.all.where(level: @rule_value.to_i).count
      count = 0

      user.test_passages.each do |test_passage|
        count += 1 if test_passage.passed && test_passage.test.level == @rule_value.to_i
      end

      true if count >= test_count
    end
  end
end
