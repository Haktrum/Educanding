class MainController < ApplicationController
  def welcome
    @presenter = QuestionsPresenter.new(params)
  end
end
