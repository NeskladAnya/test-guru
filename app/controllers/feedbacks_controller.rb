class FeedbacksController < ApplicationController
  def index
  end

  def create
    @feedback = params[:feedback]
    @user_email = params[:email]

    if @feedback.empty?
      redirect_to feedbacks_path, alert: "Please leave the feedback"
    else
      Admin.all.each { |admin| FeedbacksMailer.send_feedback(admin, @feedback, @user_email).deliver_now }

      redirect_to root_path, notice: "Thank you for the feedback!"
    end
  end
end
