class CreateComps < ActiveRecord::Migration
  def change
    create_table :comps do |t|
      t.references :location, null: false
      t.references :classification, null: false
      t.integer :percentage, null: false
      t.timestamps
    end

    add_index :comps, :location_id
    add_index :comps, :classification_id
  end
end

