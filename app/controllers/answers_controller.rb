class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    puts "****************"
    puts "#{params.inspect}"

    @user_id = session[:user_id]
    @answer = Answer.create(answerer_id: @user_id, question_id: params[:question_id], body: params[:answer][:body])
    @answer.save
    puts "AAAUUUUUGGGHHH"
    puts @answer.inspect
    redirect_to root_path
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
