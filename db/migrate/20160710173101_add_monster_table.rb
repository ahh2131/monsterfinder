class AddMonsterTable < ActiveRecord::Migration
  def change

    create_table :monsters do |t|
      t.string :name
    end
    add_column :monsters, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :monsters, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
