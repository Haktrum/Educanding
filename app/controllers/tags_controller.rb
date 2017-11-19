class TagsController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin?
    @tags = Tag.all
  end

  def new
    redirect_to root_path unless current_user.admin?
    @tag = Tag.new
  end

  def create
    redirect_to root_path unless current_user.admin?
    tag = Tag.deleted.find_by 'lower(name) = lower(?)', params[:tag][:name]
    if tag&.restore recursive: true
      redirect_to tags_url
      return
    else
      @tag = Tag.new params_create
      if @tag.save
        redirect_to tags_url
        return
      end
    end
    render :new
  end

  def show
    redirect_to root_path unless current_user.admin?
    @tag = Tag.find_by id: params[:id]
  end

  def destroy
    redirect_to root_path unless current_user.admin?
    Tag.find_by(id: params[:id]).destroy
    redirect_to tags_url
  end

  def params_create
    params.require(:tag).permit(:name)
  end
end
