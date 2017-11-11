class QuestionCommentDecorator < Draper::Decorator
  delegate_all

  def publish_at
    object.created_at.strftime("%H:%M %d-%m-%Y")
  end

end
