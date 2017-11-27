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
      @new_tag = Tag.new params_tag
      if @new_tag.save
        redirect_to tags_path
        return
      end
    end
    @tags = Tag.all.order("name ASC")
    render :index
  end

  def show
    @tag = Tag.with_deleted.find(params[:id])
    @question_tags = @tag.question_tags.with_deleted.order("created_at DESC")
  end

  def update
    @tag = Tag.find(params[:id])
    redirect_to tag_path(@tag) unless user_signed_in? && current_user.skill?("Editar etiquetas")
    unless @tag.update(params_tag)
      @errors= @tag.errors.full_messages
      @tag = Tag.find(params[:id])
    end
  end

  def destroy
    redirect_to tags_path unless user_signed_in? && current_user.skill?("Editar etiquetas")
    Tag.find(params[:id]).destroy
    redirect_to tags_path
  end

  def params_tag
    params.require(:tag).permit(:name)
  end
end
