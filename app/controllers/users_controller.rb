class UsersController < ApplicationController
  def my_perfil

  end

  def questions
    @user_questions = current_user.questions
  end

  def show

  end
end
