class AddCheeredToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_column :timelines, :cheered, :boolean, default: false
  end
end
