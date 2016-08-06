class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :descrption
      t.string :imagen

      t.timestamps null: false
    end
  end
end
