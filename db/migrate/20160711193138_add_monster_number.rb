class AddMonsterNumber < ActiveRecord::Migration
  def change
    add_column :monsters, :number, :integer
  end
end
