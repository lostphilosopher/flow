# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plan_1 = Plan.create(
  published: true,
  name: 'General Pain Management Plan',
  description: 'Sometimes pain has a purpose — it can alert us that we\'ve sprained an ankle, for example. But for many people, pain can linger for weeks or even months, causing needless suffering and interfering with quality of life. If your pain has overstayed its welcome, you should know that you have more treatment options today than ever before. Here, we\'ve listed eight techniques to control and reduce your pain that don\'t require an invasive procedure — or even taking a pill.'
)

stage_1 = Stage.create(
  name: 'Introduction',
  stage_type: 'general',
  description: 'Treatment for chronic pain depends on the cause and on the individual needs of the patient. Complete pain relief is not always possible; it is important for patients and physicians to work together to find the best treatment plan.
  Proper exercise can strengthen muscles throughout the body, improve bone strength, reduce the risk for injuries, and enhance feelings of well being. It is important to speak with a doctor before starting an exercise regimen.
  Physical therapy and massage therapy can reduce pain, improve function, and prevent recurrences. Other types of treatment that can be used to manage chronic pain include relaxation and behavior modification therapy, meditation, hypnosis, and biofeedback. Spinal manipulation (adjustment) can be used to relieve chronic pain caused by musculoskeletal conditions (e.g., osteoarthritis).
  Acupuncture, which involves inserting and manipulating fine needles under the skin at selected points in the body, may be used to relieve chronic pain.
  As many as 35 percent of patients may respond favorably to treatment with a placebo (e.g., sugar pill, saltwater injection). Precisely how a placebo works is unknown. Pain relief may result from the power of suggestion, distraction, or optimism, or from a neurochemical reaction in the brain.'
)

stage_2 = Stage.create(
  name: 'Beginning Survey',
  stage_type: 'survey',
  description: 'Please complete the following survey.',
  url: 'https://wandersen02.wufoo.com/forms/m1puiwx71b4a8ga'
)

stage_3 = Stage.create(
  name: 'Guided Meditation',
  description: 'Complete the following guided meditation',
  url: 'https://www.youtube.com/embed/r3qBlVfPzXo',
  stage_type: 'video'
)

stage_4 = Stage.create(
  name: 'Group Discussion',
  description: 'Consider contributing to the following group discussion. The topic is "How do you feel?"',
  url: 'https://demo102217.createaforum.com/general-discussion/this-is-a-demo-topic/',
  stage_type: 'discussion'
)

stage_5 = Stage.create(
  name: 'Homework',
  stage_type: 'todo',
  description: 'Perform the following strech three times each day for 5 days: Begin seated with bent knees and the feet flat on the floor. Pick up your right foot and cross the right ankle over the left thigh, allowing the knee to open to the right side. Keep an erect spine and gently lean forward, bringing your spine towards your calf. You can modify the stretch by sitting on a cushion or a chair. Hold for 30-45 seconds and then switch sides.'
)

stage_6 = Stage.create(
  name: 'Exit Survey',
  stage_type: 'survey',
  description: 'Please complete the following survey.',
  url: 'https://wandersen02.wufoo.com/forms/qu2rdmc16c0bij/'
)

i = 0
[
  stage_1,
  stage_2,
  stage_3,
  stage_4,
  stage_5,
  stage_6
].each do |stage|
  i = i + 1
  PlanStage.create(
    plan_id: plan_1.id,
    stage_id: stage.id,
    order: i
  )
end

plan_2 = Plan.create(
  published: true,
  name: 'Quick Relief for Immediate Pain',
  description: 'A plan meant to provide some immediate relief of current pain.'
)
i = 0
[
  stage_2,
  stage_3,
  stage_6
].each do |stage|
  i = i + 1
  PlanStage.create(
    plan_id: plan_2.id,
    stage_id: stage.id,
    order: i
  )
end
