class QuestionsController < ApplicationController
  def new
    redirect_to root_path unless user_signed_in? && current_user.skill?("Preguntar")
    @question = Question.new
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
    @answer = Answer.new(question: @question)
    @question_comment = QuestionComment.new(question: @question)
    @answer_comment = Answer.new()
  end

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def without_answer
    @questions = Question.without_answers
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :faculty_id, tag_ids: [])
  end
end
