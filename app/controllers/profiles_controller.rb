class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    skip_authorization
    @profile = User.find(params[:id])
    @my_requests = current_user.requests
    @my_events = current_user.events
  end

  def edit
    @profile = User.find(params[:id])
    authorize @profile
  end

  def update
    @profile = User.find(params[:id])
    @profile.update(profile_params)
    authorize @profile

    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :email, :password, :user_name, :bio, :image, :facebook, :instagram, :linkedin)
  end
end
