class AddImageToPlan < ActiveRecord::Migration[5.0]
  def change
    add_attachment :plans, :image 
  end
end
