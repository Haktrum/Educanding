class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    if current_user.admin?
      @tag = Tag.new
    else
      redirect_to :index
    end
  end

  def create
    redirect_to :index unless current_user.admin?
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
    @tag = Tag.find_by id: params[:id]
  end

  def destroy
    redirect_to :index unless current_user.admin?
    Tag.find_by(id: params[:id]).destroy
    redirect_to tags_url
  end

  def params_create
    params.require(:tag).permit(:name)
  end
end
