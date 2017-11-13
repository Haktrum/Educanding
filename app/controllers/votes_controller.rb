class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_new_params)
    @vote.save
    render :update_points
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(vote_update_params)
    render :update_points
  end

  private
  def vote_new_params
    params.require(:vote).permit(:votable_id, :votable_type, :points).merge(user: current_user)
  end

  def vote_update_params
    params.require(:vote).permit(:points)
  end
end
