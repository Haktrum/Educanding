class UsersController < ApplicationController


  def questions
    @user_questions = current_user.questions
  end

  def show
    @user = User.find(params[:id])
  end

  def skills
    @user = user
  end

  def question_votes
    votes = user.question_votes
    render 'votes', locals: { votes: votes }
  end

  def answers
    @answers = user.answers
  end

  private

  def user
    unless params[:user_id].nil? then
      User.find(params[:user_id])
    else
      current_user
    end
  end

end
