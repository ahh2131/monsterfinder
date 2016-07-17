class AddMonsterNumberToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :monster_number, :integer
  end
end
