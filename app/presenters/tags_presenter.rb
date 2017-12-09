class TagsPresenter

  def initialize(params)
    @params = params
  end

  def tags
    @tags ||= filter.call
  end

  def filter
    @filter ||= TagsFilter.new(filter_params)
  end

  private

  def filter_params
    if @params[:tags_filter]
      @params.require(:tags_filter).permit!
    else
      {}
    end
  end
end
