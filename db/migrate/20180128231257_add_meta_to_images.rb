class AddMetaToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :stages, :image_meta, :text
  end
end
