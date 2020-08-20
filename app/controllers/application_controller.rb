class ApplicationController < ActionController::Base
  # before_action :store_user_location!, if: :storable_location?

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :user_name, :bio, :image, :instagram, :linkedin])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :user_name, :bio, :image, :instagram, :linkedin])
  end

  private

  # def storable_location?
  #   request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  # end

  # def store_user_location!
  #   # :user is the scope we are authenticating
  #   store_location_for(:user, request.fullpath)
  # end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # def after_sign_in_path_for(resource)
  #   redirect = stored_location_for(resource)
  #   return redirect if redirect.present?
  # end

  # def after_update_path_for(resource)
  #   raise
  # end

end
