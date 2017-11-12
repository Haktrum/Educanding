class VotosController < ApplicationController
  def new
    @voto = Voto.new
  end

  def create
    @voto = Voto.new(voto_new_params)
    @voto.save
    redirect_to @voto.votable
  end

  def update
    @voto = Voto.find(params[:id])
    @voto.update(voto_update_params)
    redirect_to @voto.votable
  end

  private
  def voto_new_params
    params.require(:voto).permit(:user_id, :votable_id, :votable_type, :positive)
  end

  def voto_update_params
    params.require(:voto).permit(:positive)
  end
end
