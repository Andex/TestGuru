class FeedbacksMailer < ApplicationMailer

  def send_feedback(feedback)
    @feedback = feedback

    mail to: Admin.first.email, feedback: @feedback
  end
end
