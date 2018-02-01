class AddTimerToStages < ActiveRecord::Migration[5.0]
  def change
    add_column :stages, :timer, :integer
  end
end
