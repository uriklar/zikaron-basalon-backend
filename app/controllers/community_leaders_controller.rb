class CommunityLeadersController < ApplicationController
  before_action :set_community_leader, only: [:show, :update, :destroy]

  def index
    @community_leaders = CommunityLeader.all
    render json: @community_leaders
  end

  def show
    render json: @community_leader
  end

  def create
    @community_leader = CommunityLeader.new(community_leader_params)
    if @community_leader.save
      render json: @community_leader, status: :created, location: @community_leader
    else
      render json: @community_leader.errors, status: :unprocessable_entity
    end
  end

  def update
    if @community_leader.update(community_leader_params)
      render json: @community_leader
    else
      render json: @community_leader.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @community_leader.destroy
    render json: @community_leader
  end

  private
    def set_community_leader
      @community_leader = CommunityLeader.find(params[:id])
    end

    def community_leader_params
      params.require(:community_leader).permit(:email, :cities)
    end
end
