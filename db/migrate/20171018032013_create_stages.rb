class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :stage_type
      t.timestamps
    end
  end
end
