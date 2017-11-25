class SkillsController < ApplicationController

  def index
    redirect_to root_path unless user_signed_in? && current_user.skill?("Editar permisos")
    @skills = Skill.all.order("created_at ASC")
  end

  def update
    @skill = Skill.find(params[:id]).update(skill_params)
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.activo = !@skill.activo
    @skill.save
    render "update"
  end


  private

  def skill_params
    params.require(:skill).permit(:puntaje)
  end

end
