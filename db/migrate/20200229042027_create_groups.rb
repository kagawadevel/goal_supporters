class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_image
      t.text :introduce

      t.timestamps
    end
  end
end
