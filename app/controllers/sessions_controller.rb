class SessionsController < Devise::SessionsController
  def create
    super
    flash.notice = t('.notice', name: current_user.first_name)
  end
end
