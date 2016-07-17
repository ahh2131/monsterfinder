class AddSeenToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :seen, :boolean, default: false
  end
end
