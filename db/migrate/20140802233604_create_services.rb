class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.references :classification, null: false
      t.timestamps
    end

    add_index :services, :classification_id
  end
end

