class AbstractRuleSpecification

  def initialize(test_passage:, rule_value:)
    @test_passage = test_passage
    @rule_value = rule_value
  end

  def satisfies?
    raise "#{__method__} is undefined for #{self.class}"
  end
end
