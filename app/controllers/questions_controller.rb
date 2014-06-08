class QuestionsController < ApplicationController
  def index
    @questions = Question.all 
    
  end

  def new
  end

  def show
  end

  def create
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
