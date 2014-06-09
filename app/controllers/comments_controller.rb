class CommentsController < ApplicationController
  def index
    puts "PARAMS: #{params}"
    @user = User.find(params[:user_id])
    @question_comments = Comment.where(user_id: @user.id, commentable_type: "Question")
    @answer_comments = Comment.where(user_id: @user.id, commentable_type: "Answer")
    render "comments/_user_comments_all"
  end

  def create
    puts "IN COMMENT CREATE!!!!!!!!!!"
    puts "params: #{params}"

    if params[:comment][:answer]
      @answer = Answer.find(params[:comment][:answer])
      @answer.comments.build(body: params[:comment][:body], user: User.find(session[:user_id]))
      @answer.save
      redirect_to "/questions/#{@answer.question.id}"
    elsif params[:comment][:question]
      @question = Question.find(params[:comment][:question])
      @question.comments.build(body: params[:comment][:body], user: User.find(session[:user_id]))
      @question.save
      redirect_to "/questions/#{@question.id}"
    end
  end
end
