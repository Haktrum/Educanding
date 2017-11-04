class QuestionsController < ApplicationController
  def new
    if current_user
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    @question = Question.new(question_params.merge(user: current_user))
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
