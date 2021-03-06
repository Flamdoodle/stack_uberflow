require 'faker'

payam = User.create(username: "Payam", password: "hello")
nirav = User.create(username: "Nirav", password: "hello")
insung = User.create(username: "insung", password: "hello")
lawrence = User.create(username: "lrmanfre@me.com", password: "123")

@rails_question = payam.questions.create(title: "What is rails?", body: "Please tell me what Rails is.")

@n_q_comment = @rails_question.comments.build(body: "This is a great question!!!", user: nirav)
@n_q_comment.save

@i_q_comment = @rails_question.comments.build(body: "I am interested in the answers to this question as well.", user: insung)
@i_q_comment.save





@n_a = nirav.answers.create(question_id: @rails_question.id, body: "Rails is a piece of software.")

@a1 = @n_a.comments.build(body: "Thanks, I wasn't sure if it was a piece of hardware or not...", user: payam)
@a1.save

@b1 = @n_a.comments.build(body: "Payam, it is definitely NOT a piece of hardware.", user: insung)
@b1.save

@d1 = @n_a.comments.build(body: "This is Payam's SECOND comment on this answer", user: payam)
@d1.save


@i_a = insung.answers.create(question_id: @rails_question.id, body: "Rails allows you to create web apps.")
@c1 = @i_a.comments.build(body: "Yes, Insung, we can create web applications with Rails", user: lawrence)
@c1.save

@l_a = lawrence.answers.create(question_id: @rails_question.id, body: "Rails makes sweet programs.")
@l_a.save

kenny = User.create(username: "missingno15@gmail.com", password: "god")

@js_question = kenny.questions.create(
	title: "What is an Immediately Invoked Function Expression?", 
	body: "I think I have a general idea of what it is, but I am not sure of how it is different from a regular JS function."
)

@js_question.votes.create(
	user: payam,
	voteable: @js_question,
	vote_value: 1
)

@js_answer = lawrence.answers.create(
	question_id: @js_question.id,
  body: "Just as the name suggests, it is a function that is immediately executed when the program runs."
)

@js_answer.votes.create(
	user: kenny,
	voteable: @js_answer,
	vote_value: 1
)
