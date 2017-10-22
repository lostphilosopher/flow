class CreatePlanStages < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_stages do |t|
      t.integer :plan_id, index: true
      t.integer :stage_id, index: true
      t.integer :order
      t.timestamps
    end
  end
end
