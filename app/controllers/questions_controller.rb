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
    puts "#{@question.inspect}"
    redirect_to root_path
    # flash[:success] = "You successfully created a quesiton."
  end

  def show
    @new_answer = Answer.new
    @question = Question.find(params[:id])

    @answers = @question.answers

    # @usernames = []
    # @answers = []
    # @partials = []

    @question_comments = Comment.where(commentable_type: "Question", commentable_id: params[:id])

    # @question.answers.each do |answer|
    #   @usernames << User.find(answer.answerer_id).username
    #   @answers << answer.body
    #   @partials << #the partial syntax
    # end

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
  end

  def downvote
  end

  def makebest
    puts "PARAMS: #{params.inspect}"
    @question = Question.find(params[:id])
    @question.answers.each do |answer|
      if answer.best == true
        answer.update(best: false)
        puts "THEY ALREADY HAD A BEST"
      else
        puts "NO BEST!!!"
      end
    end

    @answer.update(best: true)
  end
end
