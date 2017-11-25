class QuestionsFilter

  include ActiveModel::Model

  attr_reader :search, :faculty, :tags

  def initialize(parametros, page)
    @search = parametros[:search]
    @faculty = parametros[:faculty]
    @tags = parametros[:tags]
    @page   = page
  end

  def call
    questions = Question.all
    questions = filter_params questions
    questions.paginate(page: @page, per_page: 10).decorate
  end

  private

  def filter_params(questions)
    questions = questions.with_faculty(@faculty) if @faculty.present?
    questions = questions.search(@search) if @search.present?
    @tags.each do |tag|
      questions = questions.with_tag(tag) if tag.present?
    end if @tags.present?
    questions
  end

end
