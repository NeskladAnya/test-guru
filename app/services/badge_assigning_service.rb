class BadgeAssigningService
  RULE_TYPES = {
    'attempts' => Rules::Attempts,
    'level' => Rules::Level,
    'categories' => Rules::Categories
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule_type = RULE_TYPES[badge.rule_type]
      
      if rule_type.present?
        rule = rule_type.new(test_passage: @test_passage, rule_value: badge.rule_value)
        assign_badges(badge) if rule.satisfies?
      end
    end
  end

  private
  def assign_badges(badge)
    @test_passage.user.badges.push(badge)
  end
end
