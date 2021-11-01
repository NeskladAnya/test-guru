categories = Category.create!(
  [
    { title: "Programming" },
    { title: "School" },
    { title: "Art" }
  ]
)

users = User.create!(
  [
    { name: "Peter" },
    { name: "Karl" },
    { name: "Mia" }
  ]
)

tests = Test.create!(
  [
    { title: "Ruby on Rails", level: 1, category_id: categories[1].id, author_id: users[2].id },
    { title: "School math", level: 2, category_id: categories[0].id, author_id: users[0].id },
    { title: "Music", level: 0, category_id: categories[2].id, author_id: users[0].id },
    { title: "Art", level: 5, category_id: categories[2].id, author_id: users[1].id },
    { title: "HTML", level: 3, category_id: categories[1].id, author_id: users[1].id }
  ]
)

questions = Question.create!(
  [
    { body: "What is your favourite subject?", test_id: tests[0].id },
    { body: "2 + 2 = ?", test_id: tests[1].id },
    { body: "Where was Claude Monet born?", test_id: tests[3].id },
    { body: "What is <p>?", test_id: tests[4].id },
    { body: "What is [1, 2, 3]?", test_id: tests[0].id },
    { body: "What is Freddie Mercury's real name?", test_id: tests[2].id },
    { body: "5**3 = ?", test_id: tests[1].id },
    { body: "5 + 2 * 3 = ?", test_id: tests[1].id },
    { body: "x equals to? x + 10 * 2 = 25", test_id: tests[1].id }
  ]
)

answers = Answer.create!(
  [
    { body: "Math", correct: true, question_id: questions[0].id },
    { body: "Music", correct: false, question_id: questions[0].id },
    { body: "4", correct: true, question_id: questions[1].id },
    { body: "5", correct: false, question_id: questions[1].id },
    { body: "France", correct: true, question_id: questions[2].id },
    { body: "Germany", correct: false, question_id: questions[2].id },
    { body: "Paragraph tag", correct: true, question_id: questions[3].id },
    { body: "Party", correct: false, question_id: questions[3].id },
    { body: "Hash", correct: false, question_id: questions[4].id },
    { body: "Array", correct: true, question_id: questions[4].id },
    { body: "Farrokh Bulsara", correct: true, question_id: questions[5].id },
    { body: "Freddie Mercury", correct: false, question_id: questions[5].id },
    { body: "125", correct: true, question_id: questions[6].id },
    { body: "225", correct: false, question_id: questions[6].id },
    { body: "11", correct: true, question_id: questions[7].id },
    { body: "21", correct: false, question_id: questions[7].id },
    { body: "15", correct: false, question_id: questions[8].id },
    { body: "5", correct: true, question_id: questions[8].id },
  ]
)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
