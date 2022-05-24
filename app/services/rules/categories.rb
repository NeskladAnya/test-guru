module Rules
  class Categories < AbstractRuleSpecification
    def satisfies?
      user = @test_passage.user
      category_id = Category.find_by(title: @rule_value).id

      test_count = Test.all.where(category_id: category_id).count
      count = 0

      user.test_passages.each do |test_passage|
        count += 1 if test_passage.passed && test_passage.test.category.id == category_id
      end

      true if count >= test_count
    end
  end
end
