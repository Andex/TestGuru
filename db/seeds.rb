# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# For Test_user password = '12345', for Test_user2 password = 'qwerty'
users = User.create!([{ name: 'Test_user', email: 'test_user@mail.ru', password_digest: '8cb2237d0679ca88db6464eac60da96345513964' },
                      { name: 'Test_user2', email: 'test_user2@mail.ru', password_digest: 'b1b3773a05c0ed0176787a4f1574ff0075f7521e' }])

categories = Category.create!([{ title: 'Спорт' },
                               { title: 'Музыка' },
                               { title: 'Математика' }])

tests = Test.create!([{ title: 'О Формуле 1', level: 3, category_id: categories[0].id, user_id: users[0].id },
                      { title: 'Авторы', level: 2, category_id: categories[1].id, user_id: users[0].id },
                      { title: 'Посчитаем?', level: 0, category_id: categories[2].id, user_id: users[0].id }])

tests_passages = TestPassage.create!([{ test_id: tests[0].id, user_id: users[0].id },
                                      { test_id: tests[1].id, user_id: users[0].id },
                                      { test_id: tests[1].id, user_id: users[1].id },
                                      { test_id: tests[2].id, user_id: users[1].id }])

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
