class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @user_id = session[:user_id]
    @answer = Answer.create(answerer_id: @user_id, question_id: params[:question_id], body: params[:answer][:body])
    @answer.save
    redirect_to "/questions/#{params[:question_id]}"
  end


  # def edit
  # end

  # def update
  # end

  def destroy
  end

  def upvote
    answer = Answer.find(params[:id]) 
    user = User.find(session[:user_id])
    answer.votes.create(
      user: user ,
      vote_value: 1
    )
    @question = Question.find(params[:question_id])
      redirect_to "/questions/#{@question.id}"
  end

  def downvote
    answer = Answer.find(params[:id]) 
    user = User.find(session[:user_id])
    answer.votes.create(
      user: user ,
      vote_value: -1
    )
    @question = Question.find(params[:question_id])
      redirect_to "/questions/#{@question.id}"
  end

  def makebest
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @question.answers.each do |answer|
      if answer.best == true
        answer.update_attributes(best: false) unless answer.id == @answer.id
        answer.save
      end
    end

    @answer.update_attributes(best: true)
    @answer.save

    session[:message] = "\"#{@answer.body}\" authored by \"#{@answer.answerer.username}\" is now the best answer!"

    redirect_to "/questions/#{@question.id}"
  end
end
