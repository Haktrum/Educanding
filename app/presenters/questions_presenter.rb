class QuestionsPresenter

  def initialize(params)
    @params = params
  end

  def questions
    @posts ||= filter.call
  end

  def filter
    @filter ||= QuestionsFilter.new(filter_params, @params[:page])
  end

  private

  def filter_params
    if @params[:questions_filter]
      @params.require(:questions_filter).permit!
    else
      {}
    end
  end


end
