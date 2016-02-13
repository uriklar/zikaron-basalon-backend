class HostsController < ApplicationController
  before_action :set_host, only: [:update, :destroy, :show]
  before_action :authorize_to_view_or_edit_host, only: [:update, :show]
  before_filter :authenticate_user_from_token!, only: [:update, :show]
  

  # GET /hosts
  # GET /hosts.json
  api!
  def index
    @hosts = Host.all
    render json: @hosts
  end

  # GET /hosts/1
  # GET /hosts/1.json
  api!
  def show
    render json: @host
  end

  # POST /hosts
  # POST /hosts.json
  api! description "Create host"
  param :host, Hash, required: true do
    param :hosted_before, :bool, required: true
    param :address, String, required: true
    param :public, :bool, required: true, desc: "Is the event visible to the public"
    param :free_text, String
    param :survivor_needed, :bool, required: true
    param :event_date, String, required: true
    param :event_time, String, required: true
    param :lat, String, required: true
    param :lng, String, required: true
    param :floor, :number
    param :elevator, :bool, required: true
    param :org_name, String
    param :org_role, String
    param :language, String, required: true
    param :city, String, required: true
    param :country, String, required: true
    param :user_id, :number, required: true
  end
  def create
    @host = Host.new(host_params)
    if @host.save
      #ZbMailer.registration(@host.user.id)
      render json: @host, status: :created, location: @host
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  api!
  def update
    if @host.update(host_params)
      head :no_content
    else
      render json: @host.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.json
  api!
  def destroy
    @host.destroy

    head :no_content
  end

  private

    def set_host
      @host = Host.find(params[:id])
      render json: {  }, status: :precondition_required if @host.nil?    
    end

    def host_params
      params.require(:host)
            .permit(:hosted_before, :address, :public, :free_text, :survivor_needed,
                    :event_date, :event_time, :lat, :lng, :floor, :elevator, :contacted,
                    :org_name, :org_role, :survivor_id, :language, :city, :country, :user_id)
    end

    def authorize_to_view_or_edit_host
      auth_token = request.headers['Authorization']
      user = User.find_by_access_token(auth_token)
      unless user && (user.admin || user.access_token == @host.user.access_token)
        authentication_error
      end
    end
end
