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
  end

  def downvote
  end
end
