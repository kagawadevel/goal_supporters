class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :detail
      t.integer :past
      t.integer :count
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
