class AddOwneridToBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :boards, :owner, foreign_key: { to_table: :users }
  end
end
