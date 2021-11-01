categories = 5.times do |i|
  Category.create!(title: "Category #{i}")
end

users = 3.times do |i|
  User.create!(name: "User #{i}")
end

tests = Test.create!(
  [
    { title: "Ruby on Rails", level: 1, category_id: 2, author_id: 3 },
    { title: "School math", level: 2, category_id: 1, author_id: 1 },
    { title: "Music", level: 0, category_id: 3, author_id: 1 },
    { title: "Art", level: 5, category_id: 3, author_id: 2 },
    { title: "HTML", level: 3, category_id: 2, author_id: 2 }
  ]
)

questions = Question.create!(
  [
    { body: "What is your favourite subject?", test_id: 1 },
    { body: "2 + 2 = ?", test_id: 2 },
    { body: "Where was Claude Monet born?", test_id: 4 },
    { body: "What is <p>?", test_id: 5 },
    { body: "What is [1, 2, 3]?", test_id: 1 },
    { body: "What is Freddie Mercury's real name?", test_id: 3 },
    { body: "5**3 = ?", test_id: 2 },
    { body: "5 + 2 * 3 = ?", test_id: 2 },
    { body: "x equals to? x + 10 * 2 = 25", test_id: 2 }
  ]
)

answers = Answer.create!(
  [
    { body: "Math", correct: true, question_id: 1 },
    { body: "Music", correct: false, question_id: 1 },
    { body: "4", correct: true, question_id: 2 },
    { body: "5", correct: false, question_id: 2 },
    { body: "France", correct: true, question_id: 3 },
    { body: "Germany", correct: false, question_id: 3 },
    { body: "France", correct: true, question_id: 3 },
    { body: "Paragraph tag", correct: true, question_id: 4 },
    { body: "Party", correct: false, question_id: 4 },
    { body: "Hash", correct: false, question_id: 5 },
    { body: "Array", correct: true, question_id: 5 },
    { body: "Farrokh Bulsara", correct: true, question_id: 6 },
    { body: "Freddie Mercury", correct: false, question_id: 6 },
    { body: "125", correct: true, question_id: 7 },
    { body: "225", correct: false, question_id: 7 },
    { body: "11", correct: true, question_id: 8 },
    { body: "21", correct: false, question_id: 8 },
    { body: "15", correct: false, question_id: 9 },
    { body: "5", correct: true, question_id: 9 },
  ]
)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
