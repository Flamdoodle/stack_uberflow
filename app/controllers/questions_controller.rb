class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
  end

  def create
  end

  def show
    @question = Question.find(params[:id])
    @usernames = []
    @question.answers.each do |answer|
      @usernames << User.find(answer.answerer_id).username
      @usernames << answer.body
      @usernames << "---------"
    end


    # @question
    # answer for @question (all)
  end

  def edit
  end

  def update
  end

  def destroy
    #admin only?
  end

  def upvote
  end

  def downvote
  end
end
