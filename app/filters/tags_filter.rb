class TagsFilter

  include ActiveModel::Model

  attr_reader :search

  def initialize(parametros)
    @search = parametros[:search]

  end

  def call
    tags = Tag.cant_order
    tags = filter_params tags
  end

  private

  def filter_params(tags)
    tags = tags.search(@search) if @search.present?
    tags
  end

end
