class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_new_params)
    @vote.save
    redirect_to @vote.votable
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(vote_update_params)
    redirect_to @vote.votable
  end

  private
  def vote_new_params
    params.require(:vote).permit(:user_id, :votable_id, :votable_type, :positive)
  end

  def vote_update_params
    params.require(:vote).permit(:positive)
  end
end
