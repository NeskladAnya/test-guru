class FeedbacksController < ApplicationController
  def index
  end

  def create
    @feedback = params[:feedback]
    @user_email = params[:email]

    if @feedback.empty?
      redirect_to feedbacks_path, alert: t('.alert')
    else
      Admin.all.each { |admin| FeedbacksMailer.send_feedback(admin, @feedback, @user_email).deliver_now }

      redirect_to authenticated_root_path, notice: t('.notice')
    end
  end
end
