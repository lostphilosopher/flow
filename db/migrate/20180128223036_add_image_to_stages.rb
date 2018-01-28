class AddImageToStages < ActiveRecord::Migration[5.0]
  def change
    add_attachment :stages, :image  
  end
end
