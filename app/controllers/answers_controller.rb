class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      @created_answer = @answer
      @answer = Answer.new(question: @answer.question)
    end
    redirect_to @answer.question
  end

  private

  def answer_params
    param_answer = params.require(:answer).permit(:body)
    param_answer.merge(question_id: params[:question_id], user: current_user)
  end
end
