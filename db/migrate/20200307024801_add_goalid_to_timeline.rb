class AddGoalidToTimeline < ActiveRecord::Migration[5.2]
  def change
    add_reference :timelines, :goal, foreign_key: true
  end
end
