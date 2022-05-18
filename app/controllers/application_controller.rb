class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def default_url_options
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  private

  def after_sign_in_path_for(user)
    current_user.is_a?(Admin) ? admin_tests_path : stored_location_for(user) || authenticated_root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
