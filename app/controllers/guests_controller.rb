class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :update, :destroy]

  def index
    @guests = Guest.all
    render json: @guests
  end

  def show
    render json: @guest
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      render json: @guest, status: :created, location: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  def update
    if @guest.update(guest_params)
      head :no_content
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @guest.destroy

    head :no_content
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
      render json: {  }, status: :precondition_required if @guest.nil?
    end

    def guest_params
      params.require(:guest).permit(:email, :phone, :first_name, :last_name)
    end
end
