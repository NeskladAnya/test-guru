class Admin::BaseController < ApplicationController
  before_action :admin_required!

  private

  def admin_required!
    redirect_to authenticated_root_path, alert: 'You are not an admin!' unless current_user.is_a?(Admin)
  end
end
