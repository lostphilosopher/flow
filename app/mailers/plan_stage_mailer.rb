class PlanStageMailer < ApplicationMailer
  def homework(user, stage)
    @user = user
    @stage = stage
    mail(to: @user.email, subject: 'Your Homework from Flow Chronic Pain Management')
  end
end
