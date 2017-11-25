class TagsController < ApplicationController
  def index
    @new_tag = Tag.new if user_signed_in? && current_user.skill?("Editar etiquetas")
    @tags = Tag.all.order("name ASC")
  end

  def create
    redirect_to tags_path unless user_signed_in? && current_user.skill?("Editar etiquetas")
    tag = Tag.deleted.find_by 'lower(name) = lower(?)', params[:tag][:name]
    if tag&.restore recursive: true
      redirect_to tags_path
      return
    else
      @new_tag = Tag.new params_create
      if @new_tag.save
        redirect_to tags_path
        return
      end
    end
    @tags = Tag.all.order("name ASC")
    render :index
  end

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions.order("created_at DESC")
  end

  def destroy
    redirect_to tags_path unless user_signed_in? && current_user.skill?("Editar etiquetas")
    Tag.find_by(id: params[:id]).destroy
    redirect_to tags_path
  end

  def params_create
    params.require(:tag).permit(:name)
  end
end
