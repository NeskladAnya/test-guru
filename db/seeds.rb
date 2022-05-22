Category.destroy_all
User.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
Badge.destroy_all

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
    { body: "5", correct: true, question: questions[8] }
  ]
)

badges = Badge.create!(
  [
    { name: "Smarty Pants", description: "You've passed 5 tests!", key: "5_tests_passed", image_url: "https://ecdn.teacherspayteachers.com/thumbitem/Smarty-Pants-Printable-2545420-1500876149/original-2545420-1.jpg" }, 
    { name: "Unstoppable unicorne", description: "You've passed 10 tests!", key: "10_tests_passed", image_url: "https://www.nicepng.com/png/full/210-2108253_unstable-unicorns-basic-unicorn-loves-rules-unstable-unicorns.png" },
    { name: "The Best Programmer Ever", description: "All Programming tests are passed!", key: "programming", image_url: "https://ahmadnaser.com/wp-content/uploads/2013/10/programmer_creattica_full.jpg" }, 
    { name: "Nuts", description: "All tests with the level 0 are passed!", key: "0_level", image_url: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2F1579042112%2FHealthiest%20Nuts.jpg" },
    { name: "Crazy!", description: "You've passed the test at 1st attempt!", key: "at_1_attempt", image_url: "https://i.discogs.com/F6qKrbKhxapDVOxSpHvyKJ-4oY_ymW1YFkLh9sM_Rvc/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTMxNjI5/Ny0xNjMzMjc2MzE4/LTM2NzQuanBlZw.jpeg" }
  ]
  )
