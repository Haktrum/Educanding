class UsersController < ApplicationController
  def my_perfil

  end

  def questions
    @user_questions = current_user.questions
  end

  def show

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
