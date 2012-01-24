class CreateLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string      :name
      t.string      :house_code, :limit => 1, :null => false
      t.integer     :unit_code
      t.references  :room
      t.timestamps
    end
    add_index :lamps, :name, :unique => true
  end
end
