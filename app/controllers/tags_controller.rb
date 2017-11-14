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
    @tag = Tag.new params_create
    if @tag.save
      redirect_to tags_url
    else
      render :new
    end
  end

  def params_create
    params.require(:tag).permit(:name)
  end
end
