class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  def index
    @requests = Guest.all
    render json: @requests
  end

  def show
    render json: @request
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def update
    if @request.update(request_params)
      head :no_content
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy

    head :no_content
  end

  private
    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:host_id, :guest_id, :num_of_people)
    end
end
