class CreateNodeResults < ActiveRecord::Migration
  def change
    create_table :node_results do |t|
      t.integer :node_id
      t.string :mac
      t.integer :singal_db
      t.integer :firsttime
      t.integer :lasttime

      t.timestamps null: false
    end
  end
end
