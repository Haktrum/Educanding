class QuestionsController < ApplicationController
  def new
    if current_user
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    #Funciona, pero quedo para el orto el como lo hago.
    @question = Question.new(question_params.merge(user: current_user))
    tags = params[:question][:tags]
    tags = tags.last(tags.size - 1)
    if tags.size > 5
      flash[:alert] = "Demasiadas etiquetas (Max 5)"
    elsif tags.size < 1
      flash[:alert] = "Ingrese etiquetas (Min 1)"
    end
    if @question.valid? && !flash[:alert]
      @question.save
      tags.each do |tag|
        QuestionTag.create(question: @question, tag_id: tag)
      end
      redirect_to @question
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all.order("created_at DESC")
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :faculty_id)
  end
end
