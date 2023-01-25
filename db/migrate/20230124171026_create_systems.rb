class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :name
      t.references :creator, foreign_key: {to_table: :users}
      t.timestamps null: false
    end
  end
end
