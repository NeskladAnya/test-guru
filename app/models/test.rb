class Test < ApplicationRecord

  def self.find_test(category)
    name = Category.find_by(title: category)
    Test.select(:title).where(category_id: name.id).order(title: :desc)
  end
end
