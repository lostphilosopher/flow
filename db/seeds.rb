# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plan = Plan.create(
  name: 'Demo Plan',
  description: 'This would be a summary of what this plan is about...'
)

stage_1 = Stage.create(
  name: 'Stage 1: General',
  stage_type: 'general',
  description: 'This is just a general stage with a description'
)

stage_2 = Stage.create(
  name: 'Stage 2: Video',
  url: 'https://www.youtube.com/embed/hC7IMj7WFyE',
  stage_type: 'video'
)

stage_3 = Stage.create(
  name: 'Stage 3: Discussion',
  url: 'https://demo102217.createaforum.com/general-discussion/this-is-a-demo-topic/',
  stage_type: 'discussion'
)

stage_4 = Stage.create(
  name: 'Stage 4: Todo',
  stage_type: 'todo',
  description: 'This is the body of an email.'
)

i = 0
[
  stage_1,
  stage_2,
  stage_3,
  stage_4
].each do |stage|
  i = i + 1
  PlanStage.create(
    plan_id: plan.id,
    stage_id: stage.id,
    order: i
  )
end
