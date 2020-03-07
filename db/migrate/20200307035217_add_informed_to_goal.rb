class AddInformedToGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :informed, :integer, default: 0
  end
end
