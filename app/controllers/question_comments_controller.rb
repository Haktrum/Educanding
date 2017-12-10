class QuestionCommentsController < ApplicationController

  def create
    @question_comment = QuestionComment.new(comment_params)
    if @question_comment.save
      @created_question_comment = @question_comment
      @question_comment = QuestionComment.new(question: @question_comment.question, user: current_user)
    end
  end

  def destroy
    @deleted_comment = QuestionComment.find(params[:id]).destroy
  end

  private

  def comment_params
    param_answer = params.require(:question_comment).permit(:body, :question_id)
    param_answer.merge(user: current_user)
  end

end
