# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Maks' }, { name: 'Mark' }, { name: 'Brain' },
  { name: 'Sten' }, { name: 'Bred' }])

categories = Category.create([ title: 'Ruby'}, { title: 'Ruby on Rails' }, { title: 'Javascript' }, { title: 'API' }])

tests = Test.create([{ title: 'Основы Ruby', category: categories[0] },
{ title: 'Массивы и хэши', level: 0, category: categories[0] },
{ title: 'Классы и модули', level: 1,  category: categories[1] },
{ title: 'RESTful API', level: 2, category: categories[2] },
{ title: 'Components', level: 3, category: categories[2] }])

questions = QUESTION.create([{ body: 'Отличие символа от строки?', test: tests[0] },
{ body: 'Отличия класса от модуля?', test: tests[1] },
{ body: 'Метод добавления данных в массив?', test: tests[2] },
{ body: 'В каких методах жизненного цикла стоит выполнять xhr запросы? В каких стоит «обновлять state на основе props«?', test: tests[3] },
{ body: 'Что такое RESTful?', test: tests[4] }])

answers = Answer.create([{ title: 'Строка - это просто область памяти, которую вы можете изменять.
  Символ - это просто имя. Эта конструкция очень популярна в функциональных языках
   и обычно называется атомом - нечто неделимое и неизменное. Строка создает место в памяти, а символ нет.', question: questions[0] },
{ title: 'Названием: class и module. Модуль не может иметь экземпляра класса. Модуль не имеет наследования.', question: questions[1]),
{ title: 'Метод push', question: questions[2] },
{ title: 'Xhr (ajax, асинхронные запросы) — нужно выполнять в момент componentDidMount
               Обновление state, на основе props: react до версии 16.3 — componentWillReceiveProps
               react 16.3 и выше — getDerivedStateFromProps', question: questions[3] },
{ title: 'REST — это “Representational State Transfer”, другими словами — представление данных в удобном для
  клиента формате, под клиентом мы подразумеваем клиентское ПО из модели client <-> server.
  В свою очередь веб-сервисы созданные с использованием протокола HTTP и принципов REST.', question: questions[4] }])

AssTests_And_User.create([{ user: users[0], test: tests[0] },
                          { user: users[1], test: tests[3] },
                          { user: users[2], test: tests[1] },
                          { user: users[1], test: tests[2] }])
