# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Maks')
User.create(name: 'Mark')
User.create(name: 'Brain')
User.create(name: 'Sten')
User.create(name: 'Bred')

Test.create('Основы Ruby', 0)
Test.create('Массивы и хэши', 0)
Test.create('Классы и модули', 1)
Test.create('RESTful API', 2)
Test.create('Components', 2)

QUESTION.create('Отличие символа от строки?')
QUESTION.create('Отличия класса от модуля?')
QUESTION.create('Метод добавления данных в массив?')
QUESTION.create('В каких методах жизненного цикла стоит выполнять xhr запросы? В каких стоит «обновлять state на основе props«?')
QUESTION.create('Что такое RESTful?')

Category.create('Ruby')
Category.create('Ruby on Rails')
Category.create('Javascript')
Category.create('API')

Answer.create('Строка - это просто область памяти, которую вы можете изменять.
  Символ - это просто имя. Эта конструкция очень популярна в функциональных языках
   и обычно называется атомом - нечто неделимое и неизменное. Строка создает место в памяти, а символ нет.')
Answer.create('Названием: class и module. Модуль не может иметь экземпляра класса. Модуль не имеет наследования.')
Answer.create('Метод push')
Answer.create('Xhr (ajax, асинхронные запросы) — нужно выполнять в момент componentDidMount
               Обновление state, на основе props: react до версии 16.3 — componentWillReceiveProps
               react 16.3 и выше — getDerivedStateFromProps')
Answer.create('REST — это “Representational State Transfer”, другими словами — представление данных в удобном для
  клиента формате, под клиентом мы подразумеваем клиентское ПО из модели client <-> server.
  В свою очередь веб-сервисы созданные с использованием протокола HTTP и принципов REST.')
