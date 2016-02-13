class UsersController < ApplicationController
    # POST /v1/users
    api! description "User signup"
    param :user, Hash, required: true do
      param :email, String, required: true
      param :password, String, required: true
      param :password_confirmation, String, required: true
    end
    def create
      pp request.headers['Authorization']
      @user = User.new user_params

      if @user.save
        render json: @user, serializer: SessionSerializer, root: nil
      else
        render json: { errors:@user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end