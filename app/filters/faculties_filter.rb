class FacultiesFilter

  include ActiveModel::Model

  attr_reader :search

  def initialize(parametros)
    @search = parametros[:search]
  end

  def call
    faculties = Faculty.all
    faculties = filter_params faculties
  end

  private

  def filter_params(faculties)
    faculties = faculties.search(@search) if @search.present?
    faculties
  end

end
