class AddPublishedToPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :published, :boolean
  end
end
