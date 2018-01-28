class AddAttachment < ActiveRecord::Migration[5.0]
  def change
    add_attachment :stages, :resource    
  end
end
