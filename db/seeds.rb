categories = 5.times do |i|
  Category.create(title: "Category #{i}")
end

users = 3.times do |i|
  User.create(name: "User #{i}")
end

tests = 10.times do |i|
  Test.create(title: "Test name #{i}", level: rand(6), category_id: rand(1..5), author_id: rand(1..5))
end

questions = 15.times do |i|
  Question.create(body: "Question #{i}", test_id: rand(1..10))
end

answers = 10.times do |i|
  Answer.create(body: "Answer #{i}", correct: rand(2) == 1 ? true : false, question_id: rand(1..15))
end

results = 10.times do |i|
  Result.create(user_id: rand(1..3), test_id: rand(1..10))
end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
