class HostsController < ApplicationController
  before_action :set_host, only: [:update, :destroy, :show]
  before_action :authorize_to_view_or_edit_host, only: [:update, :show]
  before_filter :authenticate_user_from_token!, only: [:update, :show]
  

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all

    render json: @hosts
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
    render json: @host
  end

  # POST /hosts
  # POST /hosts.json
  def create
    @host = Host.new(host_params)

    if @host.save
      render json: @host, status: :created, location: @host
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    if @host.update(host_params)
      head :no_content
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy

    head :no_content
  end

  private

    def set_host
      @host = Host.find_by_user_id(params[:id])
    end

    def host_params
      params.require(:host).permit(:first_name, :last_name, :email, :address, :phone, :survivor_needed, :strangers_allowed, :max_guests, :free_text, :event_date, :user_id)
    end

    def authorize_to_view_or_edit_host
      auth_token = request.headers['Authorization']
      unless @host.user && @host.user.access_token == auth_token
        authentication_error
      end
    end
end
