class AddActiveStateOnMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :active, :boolean, default: true
  end
end
