class CreatePraises < ActiveRecord::Migration[5.2]
  def change
    create_table :praises do |t|
      t.references :goal, foreign_key: true
      t.integer :praised

      t.timestamps
    end
  end
end
