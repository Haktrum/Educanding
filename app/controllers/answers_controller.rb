class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      @created_answer = @answer
      @answer = Answer.new(question: @answer.question, user: current_user)
    end
    @answer_comment = AnswerComment.new(user: current_user)
  end
  
  def show
    answer = Answer.find(params[:id])
    redirect_to answer.question
  end

  def best_answer
    question = Question.find(params[:question_id])
    answer = Answer.find(params[:id])
    question.best_answer = answer
    question.save!
    render '_update_best_answer.js.erb', locals: { question: question }
  end

  private

  def answer_params
    param_answer = params.require(:answer).permit(:body, :question_id)
    param_answer.merge(user: current_user)
  end
end
