class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :mac
      t.string :name
      t.string :location

      t.timestamps null: false
    end
  end
end
