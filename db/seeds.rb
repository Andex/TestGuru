# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# users = User.create!([{ email: 'test_user@mail.ru', password: '121212', confirmed_at: Date.today },
#                       { email: 'test_user2@mail.ru', password: 'qwerty', confirmed_at: Date.today }])
users = User.all

categories = Category.create!([{ title: 'Спорт' },
                               { title: 'Музыка' },
                               { title: 'Математика' }])

tests = Test.create!([{ title: 'О Формуле 1', level: 3, category_id: categories[0].id, user_id: users[0].id },
                      { title: 'Авторы', level: 2, category_id: categories[1].id, user_id: users[0].id },
                      { title: 'Посчитаем?', level: 0, category_id: categories[2].id, user_id: users[0].id }])

questions = Question.create!([{ body: 'Назовите последнего чемпиона команды Ferrari', test_id: tests[0].id },
                              { body: 'Кто автор песни Bohemian Rhapsody?', test_id: tests[1].id },
                              { body: 'Корень из 196', test_id: tests[2].id },
                              { body: 'Назовите мировой чемпионат, высший класс гонок на автомобилях с открытыми колёсами', test_id: tests[0].id }])

answers = Answer.create!([{ body: 'Кими Райкконен', question_id: questions[0].id, correct: true },
                          { body: 'Михаэль Шумахер', question_id: questions[0].id, correct: false },
                          { body: 'Феллипе Масса', question_id: questions[0].id, correct: false },

                          { body: 'Пол Маккартни', question_id: questions[1].id, correct: false },
                          { body: 'Фредди Меркьюри', question_id: questions[1].id, correct: false },

                          { body: '14', question_id: questions[2].id, correct: true },
                          { body: '16', question_id: questions[2].id, correct: false },

                          { body: 'Формула 1', question_id: questions[3].id, correct: true },
                          { body: 'NASCAR', question_id: questions[3].id, correct: false },
                          { body: 'Формула 3', question_id: questions[3].id, correct: false }])
