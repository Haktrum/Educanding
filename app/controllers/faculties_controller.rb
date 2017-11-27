class FacultiesController < ApplicationController
  def index
    @new_faculty = Faculty.new if user_signed_in? && current_user.skill?("Editar facultades")
    @faculties = Faculty.all.order("name ASC")
  end

  def show
    @faculty = Faculty.with_deleted.find(params[:id])
    @questions = @faculty.questions.order("created_at DESC")
  end

  def create
    redirect_to faculties_path unless user_signed_in? && current_user.skill?("Editar facultades")
    faculty = Faculty.deleted.find_by 'lower(name) = lower(?)', params[:faculty][:name]
    if faculty&.restore recursive: true
      redirect_to faculties_path
      return
    else
      @new_faculty = Tag.new params_faculty
      if @new_faculty.save
        redirect_to faculties_path
        return
      end
    end
    @faculties = Faculty.all.order("name ASC")
    render :index
  end

  def update
    @faculty = Faculty.find(params[:id])
    redirect_to tag_path(@faculty) unless user_signed_in? && current_user.skill?("Editar facultades")
    unless @faculty.update(params_faculty)
      @errors= @faculty.errors.full_messages
      @faculty = Faculty.find(params[:id])
    end
  end

  def destroy
    redirect_to faculties_path unless user_signed_in? && current_user.skill?("Editar facultades")
    Faculty.find(params[:id]).destroy
    redirect_to faculties_path
  end

  def params_faculty
    params.require(:faculty).permit(:name)
  end
end
