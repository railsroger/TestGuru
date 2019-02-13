# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admins = User.create!([{first_name: 'Maks', last_name: 'Aleksandrovich', email: 'railsroger@gmail.com', password: 'Rabbit20118!', type: 'Admin'}])

users = User.create([{ first_name: 'Maks', last_name: 'Fimmel', email: 'sss@yandex.ru', password: '1234567' },
                     { first_name: 'Egor', last_name: 'Popov', email: 'adam@yandex.ru', password: '5669024!'  }])

categories = Category.create([{ title: 'Ruby' },
                              { title: 'Javascript' },
                              { title: 'Python' },
                              { title: 'HTML' }])

tests = Test.create([{ title: 'OOP', category: categories.first, author_id: admins },
             { title: 'React', level: 4, category: categories[1], author_id: admins },
             { title: 'Bootstrap', level: 0, category: categories[3], author_id: admins },
             { title: 'Metaprogramming', level: 5, category: categories.first, author_id: admins },
             { title: 'Rails', level: 6, category: categories.first, author_id: admins }])

questions = Question.create([{ body: 'What is a class?', test: tests.first },
                             { body: 'What is a module?', test: tests.first },
                             { body: 'How to inherit from another class?', test: tests.first },
                             { body: 'Component lifecycle', test: tests[1] },
                             { body: 'What will val1 and val2 equal after the code below is executed?', test: tests[1] },
                             { body: 'Instrument to make native apps with React', test: tests[1] },
                             { body: 'What is metaprogramming?', test: tests[3] },
                             { body: 'Grid structure', test: tests[2] },
                             { body: 'What are attributes and how do you use them?', test: tests[2] },
                             { body: 'How to delete database?', test: tests.last }])

Answer.create([{ title: 'Class is an object and object is a class', correct: true,               question: questions.first },
               { title: 'ComponentDidMount, ComponentWillMount, etc.', question: questions[2] },
               { title: 'Using < symbol', correct: true, question: questions[1] },
               { title: '<input type="text" />', correct: true, question: questions[2] },
               { title: 'React Native', correct: true, question: questions[3] },
               { title: 'Some magic', question: questions[4] },
               { title: '(val1 = true) and false / val2 = (true && false)', question: questions[4] },   
               { title: '12-column layout', correct: true, question: questions[5] },
               { title: 'rails db:drop', correct: true, question: questions[6] }])

TestPassage.create([{ user: users.first, test: tests.first },
                    { user: users.first, test: tests[1] },
                    { user: users.last, test: tests[4] }])
