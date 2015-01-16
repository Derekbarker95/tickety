class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.string :name
      t.string :email
      t.string :department
      t.text :message

      t.timestamps null: false
    end
  end
end
