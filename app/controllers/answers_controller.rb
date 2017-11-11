class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      @created_answer = @answer
      @answer = Answer.new(question: @answer.question, user: current_user)
    end
    @answer_comment = AnswerComment.new(user: current_user)
  end

  private

  def answer_params
    param_answer = params.require(:answer).permit(:body, :question_id)
    param_answer.merge(user: current_user)
  end
end
