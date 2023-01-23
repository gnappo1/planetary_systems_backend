class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :rot_time
      t.string :rev_time
      t.float :temperature
      t.references :system

      t.timestamps null: false
    end
  end
end
