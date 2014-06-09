module ApplicationHelper
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    if logged_in?
      @user ||= User.find(session[:user_id])
    end
  end

  def count_votes_of(obj)
  	return 0 if obj.votes.empty?
  	vote_values = obj.votes.map { |vote| vote.vote_value }
  	vote_count  = vote_values.inject(:+)
  	vote_count
  end
end
