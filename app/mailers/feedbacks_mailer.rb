class FeedbacksMailer < ApplicationMailer
  def send_feedback(admin, feedback, user_email)
    @user_email = user_email
    @feedback = feedback
    mail to: admin.email, subject: "Feedback"
  end
end
