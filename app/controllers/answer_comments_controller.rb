class AnswerCommentsController < ApplicationController

  def create
    @answer_comment = AnswerComment.new(answer_params)
    if @answer_comment.save
      @created_answer_comment = @answer_comment
      @answer_comment = AnswerComment.new(answer_id: @answer_comment.answer.id)
    end
  end

  private

  def answer_params
    param_answer = params.require(:answer_comment).permit(:body, :answer_id)
    param_answer.merge(user: current_user)
  end
end
