class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      response = {
        user: user.user_serializer
      }
      render json: response, status: :ok
    else
      render json: {
        error: "Invalid login"
      }
    end
  end

  def get_current_user
    if logged_in?
      render json: {
          user: current_user.user_serializer
        }, status: :ok
    else
      render json: {error: "No current user"}
    end
  end

  def destroy
    session.clear
    render json: {
      message: "Successfully logged out"
    }
  end
end
