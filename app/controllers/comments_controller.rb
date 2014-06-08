class CommentsController < ApplicationController
  def index
    puts "PARAMS: #{params}"
    @user = User.find(params[:user_id])
    @question_comments = Comment.where(user_id: @user.id, commentable_type: "Question")
    @answer_comments = Comment.where(user_id: @user.id, commentable_type: "Answer")
    render "comments/_user_comments_all"
  end
end
