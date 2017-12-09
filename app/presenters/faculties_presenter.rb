class FacultiesPresenter

  def initialize(params)
    @params = params
  end

  def faculties
    @faculties ||= filter.call
  end

  def filter
    @filter ||= FacultiesFilter.new(filter_params)
  end

  private

  def filter_params
    if @params[:faculties_filter]
      @params.require(:faculties_filter).permit!
    else
      {}
    end
  end
end
