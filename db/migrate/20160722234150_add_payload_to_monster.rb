class AddPayloadToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :payload, :json
  end
end
