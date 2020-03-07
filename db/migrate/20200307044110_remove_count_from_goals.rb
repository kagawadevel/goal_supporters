class RemoveCountFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :count, :integer
  end
end
