class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy]

  api!
  def index
    @survivors = Survivor.all
    render json: @survivors
  end

  def show
    render json: @survivor
  end

  api! description "Create survivor"
  param :survivor, Hash, required: true do
    param :name, String, required: true
    param :phone, String, required: true
    param :address, String, required: true
  end
  def create
    @survivor = Survivor.new(survivor_params)
    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @survivor.update(survivor_params)
      head :no_content
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @survivor.destroy

    render json: @survivor
  end

  private
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    def survivor_params
      params.require(:survivor).permit(:name, :phone, :address, :contacted)
    end
end
