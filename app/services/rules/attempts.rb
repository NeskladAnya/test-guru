module Rules
  class Attempts < AbstractRuleSpecification
    def satisfies?
      user = @test_passage.user

      true if user.test_passages.where(test_id: @test_passage.test.id).count.to_s == @rule_value
    end
  end
end
