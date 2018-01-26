class PlanStageMailerPreview < ActionMailer::Preview
  def homework
    PlanStageMailer.homework(User.first, Stage.first)
  end
end
