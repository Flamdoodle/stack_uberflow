class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create

    @user_id = session[:user_id]
    @question = Question.create(asker_id: @user_id, title: params[:question][:title], body: params[:question][:body])
    redirect_to root_path
  end

  def show
    @new_answer = Answer.new
    @question = Question.find(params[:id])
    @new_comment = Comment.new

    @answers = @question.answers

    @question_comments = Comment.where(commentable_type: "Question", commentable_id: params[:id])
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    question = Question.find params[:id]
    question.destroy
    redirect_to root_path
  end

  def upvote
    question = Question.find(params[:id])
    if session[:user_id]
      user = User.find(session[:user_id])
      question.votes.create(
        user: user,
        vote_value: 1
      )
      @question = Question.find(params[:id])
      redirect_to "/questions/#{@question.id}"
    else
      redirect_to root_path
    end
  end

  def downvote
    question = Question.find(params[:id])
    if session[:user_id]
      user = User.find(session[:user_id])
      question.votes.create(
        user: user,
        vote_value: -1
      )
      @question = Question.find(params[:id])
      redirect_to "/questions/#{@question.id}"
    else
      redirect_to root_path
    end
  end
  
end
