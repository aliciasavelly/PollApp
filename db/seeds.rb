# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alicia = User.create!(user_name: 'ke$ha')
dan = User.create!(user_name: 'spaniel')

a_poll = Poll.create!(title: 'Cool animals', author_id: alicia.id)
d_poll = Poll.create!(title: 'Volcanoes', author_id: dan.id)

a_question1 = Question.create!(text: "What's the coolest animal?", poll_id: a_poll.id)
a_question2 = Question.create!(text: "What's the fluffiest animal?", poll_id: a_poll.id)
d_question3 = Question.create!(text: "Where you gonna go when the volcano blows?", poll_id: d_poll.id)

a_answer1 = AnswerChoice.create!(text: "Puppy", question_id: a_question1.id)
a_answer2 = AnswerChoice.create!(text: "Kitty", question_id: a_question1.id)
a_answer3 = AnswerChoice.create!(text: "Elephant", question_id: a_question1.id)
a_answer4 = AnswerChoice.create!(text: "Snake", question_id: a_question1.id)

a_answer5 = AnswerChoice.create!(text: "Sheep", question_id: a_question2.id)
a_answer6 = AnswerChoice.create!(text: "Cow", question_id: a_question2.id)

d_answer7 = AnswerChoice.create!(text: "Cincinatti", question_id: d_question3.id)
d_answer8 = AnswerChoice.create!(text: "Timbuktu", question_id: d_question3.id)
d_answer9 = AnswerChoice.create!(text: "Mars", question_id: d_question3.id)
d_answer10 = AnswerChoice.create!(text: "The volcano itself", question_id: d_question3.id)

a_response1 = Response.create!(answer_choice_id: a_answer3.id, respondent_id: alicia.id)
a_response2 = Response.create!(answer_choice_id: a_answer5.id, respondent_id: alicia.id)
a_response3 = Response.create!(answer_choice_id: d_answer10.id, respondent_id: alicia.id)
d_response4 = Response.create!(answer_choice_id: a_answer3.id, respondent_id: dan.id)
d_response5 = Response.create!(answer_choice_id: a_answer6.id, respondent_id: dan.id)
d_response6 = Response.create!(answer_choice_id: d_answer9.id, respondent_id: dan.id)
d_response7 = Response.create!(answer_choice_id: d_answer7.id, respondent_id: dan.id)



alicia = User.find(1)
dan = User.find(2)

a_poll = Poll.find(1)
d_poll = Poll.find(2)

a_question1 = Question.find(1)
a_question2 = Question.find(2)
d_question3 = Question.find(3)

a_answer1 = AnswerChoice.find(1)
a_answer2 = AnswerChoice.find(2)
a_answer3 = AnswerChoice.find(3)
a_answer4 = AnswerChoice.find(4)

a_answer5 = AnswerChoice.find(5)
a_answer6 = AnswerChoice.find(6)

d_answer7 = AnswerChoice.find(7)
d_answer8 = AnswerChoice.find(8)
d_answer9 = AnswerChoice.find(9)
d_answer10 = AnswerChoice.find(10)

a_response1 = Response.find(1)
a_response2 = Response.find(2)
a_response3 = Response.find(3)
d_response4 = Response.find(4)
d_response5 = Response.find(5)
d_response6 = Response.find(6)
d_response7 = Response.find(7)
