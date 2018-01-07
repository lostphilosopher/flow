class CreateAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.boolean :paid, default: false
      t.belongs_to :user, index: true
    end
  end
end
