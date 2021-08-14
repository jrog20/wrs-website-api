class SessionsController < ApplicationController
  def create
    # Changing from email: params[:user][:email] to 
    # email: params[:email] stops the 500 error, but redirects to home
  # binding.pry
    # *** MAYBE THIS? ***:     
    # @user = User.find_by_email(params[:email])
    # if @user && @user.authenticate(params[:password])

    @user = User.find_by(email: params[:session][:email])
    # Changed from params[:user][:password]
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      response = {
        user: @user.user_serializer
      }
      render json: response, status: :ok
    else
      response = {
        error: "Invalid login",
        details: @user.errors.full_messages
      }
      render json: response, status: :unauthorized
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
