class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name, null: false
      t.ltree :path, null: false
      t.timestamps
    end
  end
end

