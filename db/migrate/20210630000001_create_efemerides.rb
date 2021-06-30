class CreateEfemerides < ActiveRecord::Migration[6.1]
  def change
    create_table :efemerides do |t|
      t.longtext :text
      t.date :date
      t.integer :blob_id, null: false, default: -1
      t.integer :category_id, null: false, default: -1
      t.timestamps
    end
  end
end
