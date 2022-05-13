Category.destroy_all
User.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

categories = Category.create!(
  [
    { title: "Programming" },
    { title: "School" },
    { title: "Art" }
  ]
)

tests = Test.create!(
  [
    { title: "Ruby on Rails", level: 1, category: categories[1], author: users[2] },
    { title: "School math", level: 2, category: categories[0], author: users[0] },
    { title: "Music", level: 0, category: categories[2], author: users[0] },
    { title: "Art", level: 5, category: categories[2], author: users[1] },
    { title: "HTML", level: 3, category: categories[1], author: users[1] }
  ]
)

questions = Question.create!(
  [
    { body: "What is your favourite subject?", test: tests[0] },
    { body: "2 + 2 = ?", test: tests[1] },
    { body: "Where was Claude Monet born?", test: tests[3] },
    { body: "What is <p>?", test: tests[4] },
    { body: "What is [1, 2, 3]?", test: tests[0] },
    { body: "What is Freddie Mercury's real name?", test: tests[2] },
    { body: "5**3 = ?", test: tests[1] },
    { body: "5 + 2 * 3 = ?", test: tests[1] },
    { body: "x equals to? x + 10 * 2 = 25", test: tests[1] }
  ]
)

answers = Answer.create!(
  [
    { body: "Math", correct: true, question: questions[0] },
    { body: "Music", correct: false, question: questions[0] },
    { body: "4", correct: true, question: questions[1] },
    { body: "5", correct: false, question: questions[1] },
    { body: "France", correct: true, question: questions[2] },
    { body: "Germany", correct: false, question: questions[2] },
    { body: "Paragraph tag", correct: true, question: questions[3] },
    { body: "Party", correct: false, question: questions[3] },
    { body: "Hash", correct: false, question: questions[4] },
    { body: "Array", correct: true, question: questions[4] },
    { body: "Farrokh Bulsara", correct: true, question: questions[5] },
    { body: "Freddie Mercury", correct: false, question: questions[5] },
    { body: "125", correct: true, question: questions[6] },
    { body: "225", correct: false, question: questions[6] },
    { body: "11", correct: true, question: questions[7] },
    { body: "21", correct: false, question: questions[7] },
    { body: "15", correct: false, question: questions[8] },
    { body: "5", correct: true, question: questions[8] },
  ]
)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
